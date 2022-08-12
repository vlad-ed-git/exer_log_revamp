import 'package:exer_log_revamp/features/auth/data/utils/phone_verification_callback.dart';

class FirePhoneVerificationCallback implements PhoneVerificationCallback {
  @override
  dynamic credential;

  @override
  String? errMsg;

  @override
  bool errorOccurred;

  @override
  bool isAutoVerified;

  @override
  bool isCodeSent;

  @override
  int? resendToken;

  @override
  String? verificationId;

  FirePhoneVerificationCallback(
      {this.credential,
      this.errMsg,
      this.errorOccurred = false,
      this.isAutoVerified = false,
      this.isCodeSent = false,
      this.resendToken,
      this.verificationId});
}
