part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordSendCodeEvent extends ForgotPasswordEvent {
  const ForgotPasswordSendCodeEvent({required this.formData});
  final FormData formData;
}

class ForgotPasswordVerifyCodeEvent extends ForgotPasswordEvent {
  const ForgotPasswordVerifyCodeEvent({required this.formData});
  final FormData formData;
}

class ForgotPasswordChangePassword extends ForgotPasswordEvent {
  const ForgotPasswordChangePassword({required this.formData});
  final FormData formData;
}
