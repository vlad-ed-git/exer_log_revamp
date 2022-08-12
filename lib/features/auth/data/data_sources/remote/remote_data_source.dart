import 'package:exer_log_revamp/core/utils/service_result.dart';
import 'package:exer_log_revamp/features/auth/data/utils/phone_verification_callback.dart';
import 'package:exer_log_revamp/features/auth/domain/model/auth_user.dart';

abstract class RemoteDataSource {
  AuthUser? getAuthUser();
  signUserOut();
  sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    int? resendToken,
    required Function(PhoneVerificationCallback result) callback,
  });
  Future<ServiceResult> signInWithVerificationCode(
      {required String verificationCode, required String verificationId});
  Future<ServiceResult> signInWithCredentials({dynamic credential});
}
