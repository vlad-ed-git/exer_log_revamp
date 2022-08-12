import 'package:exer_log_revamp/core/utils/service_result.dart';
import 'package:exer_log_revamp/res/strings.dart';

class CheckAuthUserUseCase {
  Future<ServiceResult> execute() async {
    //TODO try to get the authenticated user
    //TODO IF NO USER IS FOUND, RETURN NULL
    //TODO IF AN ERROR OCCURRED RETURN THAT
    return ServiceResult(isSuccessful: false, errMsg: checkAuthErr);
  }
}
