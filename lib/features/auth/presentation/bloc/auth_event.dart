part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent(
    this.formData,
  );
  final FormData formData;
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class LoginStatusEvent extends AuthEvent {
  const LoginStatusEvent();
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent(
    this.formData,
  );
  final FormData formData;
}
