part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileDataState extends ProfileState {
  const ProfileDataState({required this.userData});
  final UserModel userData;
}

class PrivacySuccessState extends ProfileState {
  const PrivacySuccessState(this.data);
  final PrivacyModel data;
}

class ProfileErrorState extends ProfileState {
  const ProfileErrorState(this.error);
  final ErrorModel error;
}

class ProfileUpdateSuccess extends ProfileState {
  const ProfileUpdateSuccess(this.success);
  final SuccessModel success;
}
