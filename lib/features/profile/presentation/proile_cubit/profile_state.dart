part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel user;
  ProfileLoaded({required this.user});
}

class ProfileFailure extends ProfileState {
  final String errorMessage;
  ProfileFailure({required this.errorMessage});
}
