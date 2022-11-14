part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

@immutable
class AuthInitialState extends AuthState {}

@immutable
class AuthLoadingState extends AuthState {}

@immutable
class AuthLogoutState extends AuthState {}

@immutable
class AuthLogoutLoadingState extends AuthState {}

@immutable
class AuthSuccessState extends AuthState {
  const AuthSuccessState(this.data);
  final UserModel data;
}

@immutable
class UnAuthenticatedState extends AuthState {
  const UnAuthenticatedState();
}

@immutable
class RegisterSuccessState extends AuthState {
  const RegisterSuccessState(this.registerData);
  final SuccessModel registerData;
}

@immutable
class AuthErrorState extends AuthState {
  const AuthErrorState(this.error);
  final ErrorModel error;
}
