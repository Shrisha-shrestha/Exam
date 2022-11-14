part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  const ForgotPasswordSuccess(this.success);

  final SuccessModel success;
}

class ForgotPasswordError extends ForgotPasswordState {
  const ForgotPasswordError(this.error);
  final ErrorModel error;
}

class ForgotPasswordLoading extends ForgotPasswordState {}
