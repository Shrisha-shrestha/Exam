part of 'social_auth_bloc.dart';

abstract class SocialAuthState extends Equatable {
  const SocialAuthState();

  @override
  List<Object> get props => [];
}

class SocialAuthInitial extends SocialAuthState {}

class SocialLoadingInitial extends SocialAuthState {}

class SocialSignInSuccessState extends SocialAuthState {
  const SocialSignInSuccessState(this.userData);
  final SocialLoginModel userData;
}

class SoicalAuthErrorState extends SocialAuthState {
  const SoicalAuthErrorState(this.error);
  final ErrorModel error;
}
// class LoginWithSDataState extends SocialAuthState {
//   const LoginWithSDataState(this.success);
//   final SuccessModel success;
// }
