class ServiceResult {
  final bool isSuccessful;
  final dynamic data;
  final String? errMsg;
  ServiceResult({required this.isSuccessful, this.data, this.errMsg});
}
