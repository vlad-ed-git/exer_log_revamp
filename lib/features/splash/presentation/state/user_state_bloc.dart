import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:exer_log_revamp/core/utils/service_result.dart';
import 'package:exer_log_revamp/features/splash/domain/usecases/splash_usecases.dart';
import 'package:flutter/material.dart';

part 'user_state_event.dart';
part 'user_state_state.dart';

class UserStateBloc extends Bloc<UserStateEvent, UserStateState> {
  final SplashUseCases splashUseCases;
  UserStateBloc(this.splashUseCases) : super(InitialUserState()) {
    on<CheckAuthUserEvent>(_onCheckAuthUserEvent);
    on<CheckUserProfileEvent>(_onCheckUserProfileEvent);
  }

  FutureOr<void> _onCheckAuthUserEvent(
      CheckAuthUserEvent event, Emitter<UserStateState> emit) async {
    emit(LoadingAuthUserState());
    ServiceResult result = await splashUseCases.checkAuthUserUseCase.execute();
    if (result.isSuccessful) {
      //todo pass the auth user OR null
      emit(LoadedAuthUserState());
    } else {
      emit(LoadingAuthUserFailedState(result.errMsg!));
    }
  }

  FutureOr<void> _onCheckUserProfileEvent(
      CheckUserProfileEvent event, Emitter<UserStateState> emit) async {
    emit(LoadingUserProfileState());
    ServiceResult result = await splashUseCases.checkUserProfileUseCase.execute();
    if (result.isSuccessful) {
      //todo pass the user profile OR null
      emit(LoadedUserProfileState());
    } else {
      emit(LoadingUserProfileFailedState(result.errMsg!));
    }
  }
}
