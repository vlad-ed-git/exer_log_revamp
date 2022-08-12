import 'package:exer_log_revamp/features/splash/domain/usecases/check_auth_usecase.dart';
import 'package:exer_log_revamp/features/splash/domain/usecases/check_user_profile_usecase.dart';
import 'package:exer_log_revamp/features/splash/domain/usecases/splash_usecases.dart';
import 'package:exer_log_revamp/features/splash/presentation/state/user_state_bloc.dart';
import 'package:get_it/get_it.dart';

void init() {
  final GetIt splashDi = GetIt.instance;

  //user state bloc
  splashDi.registerFactory<UserStateBloc>(() => UserStateBloc(splashDi()));

  //useCases
  splashDi.registerLazySingleton<SplashUseCases>(
      () => SplashUseCases(splashDi(), splashDi()));

  splashDi.registerLazySingleton<CheckAuthUserUseCase>(
      () => CheckAuthUserUseCase());

  splashDi.registerLazySingleton<CheckUserProfileUseCase>(
      () => CheckUserProfileUseCase());
}
