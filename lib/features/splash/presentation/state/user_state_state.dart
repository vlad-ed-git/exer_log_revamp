part of 'user_state_bloc.dart';

@immutable
abstract class UserStateState {}

class InitialUserState extends UserStateState {}

//fetch
class LoadingAuthUserState extends UserStateState {}

class LoadingUserProfileState extends UserStateState {}

//success
class LoadedAuthUserState extends UserStateState {}

class LoadedUserProfileState extends UserStateState {}

//error
class LoadingAuthUserFailedState extends UserStateState {
  final String errMsg;
  LoadingAuthUserFailedState(this.errMsg);
}

class LoadingUserProfileFailedState extends UserStateState {
  final String errMsg;
  LoadingUserProfileFailedState(this.errMsg);
}
