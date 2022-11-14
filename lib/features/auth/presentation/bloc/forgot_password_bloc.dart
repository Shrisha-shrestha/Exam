import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/features/auth/domain/repositories/auth_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

mixin CodeVerifyBloc on Bloc<ForgotPasswordEvent, ForgotPasswordState> {}
mixin ResetPasswordBloc on Bloc<ForgotPasswordEvent, ForgotPasswordState> {}

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState>
    with CodeVerifyBloc, ResetPasswordBloc {
  ForgotPasswordBloc({required this.authRepo})
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordSendCodeEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      final response = await authRepo.sendCode(formData: event.formData);

      response.fold(
        (l) => emit(ForgotPasswordSuccess(l)),
        (r) => emit(ForgotPasswordError(r)),
      );
    });

    on<ForgotPasswordVerifyCodeEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      final response = await authRepo.verifyCode(formData: event.formData);

      response.fold(
        (l) => emit(ForgotPasswordSuccess(l)),
        (r) => emit(ForgotPasswordError(r)),
      );
    });

    on<ForgotPasswordChangePassword>((event, emit) async {
      emit(ForgotPasswordLoading());
      final response = await authRepo.changePassword(formData: event.formData);

      response.fold(
        (l) => emit(ForgotPasswordSuccess(l)),
        (r) => emit(ForgotPasswordError(r)),
      );
    });
  }
  final AuthRepository authRepo;
}
