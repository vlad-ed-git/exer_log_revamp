part of 'user_state_bloc.dart';

@immutable
abstract class UserStateEvent {}

class CheckAuthUserEvent extends UserStateEvent {}

class CheckUserProfileEvent extends UserStateEvent {}
