part of 'user_cubit.dart';

class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class ProfilePicUpdated extends UserState {}

class UserSuccess extends UserState {
  final dynamic userData;
  UserSuccess(this.userData);
}

final class UserFailure extends UserState {
  final String errMessage;

  UserFailure(String string, {required this.errMessage});
}
