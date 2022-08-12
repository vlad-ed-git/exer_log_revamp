import 'package:exer_log_revamp/core/utils/service_result.dart';
import 'package:exer_log_revamp/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:exer_log_revamp/features/auth/data/entities/auth_user_entity.dart';
import 'package:exer_log_revamp/features/auth/data/utils/fire_phone_verification_callback.dart';
import 'package:exer_log_revamp/features/auth/data/utils/phone_verification_callback.dart';
import 'package:exer_log_revamp/features/auth/domain/model/auth_user.dart';
import 'package:exer_log_revamp/res/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FireAuth implements RemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  AuthUser? getAuthUser() {
    try {
      User? user = _auth.currentUser;
      if (user == null) return null;
      return AuthUserEntity(id: user.uid, phoneNumber: user.phoneNumber!);
    } catch (e) {
      if (kDebugMode) {
        print("==== getAuthUser exc $e  ====");
      }
      return null;
    }
  }

  @override
  signUserOut() async {
    await _auth.signOut();
  }

  @override
  sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    int? resendToken,
    required Function(PhoneVerificationCallback result) callback,
  }) {
    String formattedPhone =
        (countryCode.trim() + phoneNumber.trim()).replaceAll(" ", "");

    _auth.verifyPhoneNumber(
        phoneNumber: formattedPhone,
        forceResendingToken: resendToken,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {
          callback(FirePhoneVerificationCallback(
            credential: credential,
            isAutoVerified: true,
          ));
        },
        verificationFailed: (FirebaseAuthException e) {
          String errMsg = failedToVerifyPhoneErr;
          if (e.code == 'invalid-phone-number') {
            errMsg = invalidPhoneNumErr;
          }
          callback(FirePhoneVerificationCallback(
              errorOccurred: true, errMsg: errMsg));
        },
        codeSent: (String verificationId, int? resendToken) {
          callback(FirePhoneVerificationCallback(
              verificationId: verificationId, resendToken: resendToken));
        },
        codeAutoRetrievalTimeout: (_) {});
  }

  @override
  Future<ServiceResult> signInWithVerificationCode(
      {required String verificationCode,
      required String verificationId}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: verificationCode);
    return await signInWithCredentials(credential: credential);
  }

  @override
  Future<ServiceResult> signInWithCredentials({dynamic credential}) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return ServiceResult(isSuccessful: true, data: userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-verification-code") {
        return ServiceResult(
            isSuccessful: false, errMsg: invalidVerificationCodeErr);
      }
      return ServiceResult(isSuccessful: false, errMsg: failedToVerifyPhoneErr);
    }
  }
}
