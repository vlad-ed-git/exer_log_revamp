abstract class PhoneVerificationCallback {
  dynamic credential;
  String? errMsg;
  bool errorOccurred;
  bool isAutoVerified;
  bool isCodeSent;
  int? resendToken;
  String? verificationId;

  PhoneVerificationCallback(
      this.credential,
      this.errMsg,
      this.errorOccurred,
      this.isAutoVerified,
      this.isCodeSent,
      this.resendToken,
      this.verificationId);
}
