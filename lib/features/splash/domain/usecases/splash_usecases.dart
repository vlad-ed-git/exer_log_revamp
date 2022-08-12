import 'package:exer_log_revamp/features/splash/domain/usecases/check_auth_usecase.dart';
import 'package:exer_log_revamp/features/splash/domain/usecases/check_user_profile_usecase.dart';

class SplashUseCases {
  final CheckAuthUserUseCase checkAuthUserUseCase;
  final CheckUserProfileUseCase checkUserProfileUseCase;
  SplashUseCases(this.checkAuthUserUseCase, this.checkUserProfileUseCase);
}
