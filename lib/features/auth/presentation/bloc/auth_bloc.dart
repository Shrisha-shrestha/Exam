import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/core/storage/secure_storage.dart';
import 'package:creatu_exam/features/auth/data/models/user_model.dart';
import 'package:creatu_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:creatu_exam/features/exams/data/models/save_result_drift_model.dart'
    as database;
import 'package:dio/dio.dart';
import 'package:drift/drift.dart' as df;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

mixin RegisterBloc on Bloc<AuthEvent, AuthState> {}

class AuthBloc extends Bloc<AuthEvent, AuthState> with RegisterBloc {
  AuthBloc({required this.authRepository}) : super(AuthInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      final response = await authRepository.login(formData: event.formData);

      await response.fold(
        (l) async {
          if (l.accessToken != null) {
            await _secureService.setToken(l.accessToken!);
            await getIt<database.MyExamDatabase>().insertOrUpdateUser(
              database.DriftUserModelsCompanion(
                userId: df.Value(l.user!.id!),
                email: df.Value(l.user?.email),
                name: df.Value(l.user?.name),
                image: df.Value(l.user?.image),
                loginType: df.Value(l.loginType),
                phoneNo: df.Value('${l.user?.phoneNo ?? ''}'),
                address: df.Value(l.user?.address ?? ''),
                dateOfBirth: df.Value(l.user?.dateofbirth),
              ),
            );

            emit(AuthSuccessState(l));
          } else {
            emit(
              const AuthErrorState(
                ErrorModel(message: 'Something Went Wrong,Try Again Later'),
              ),
            );
          }
        },
        (r) async => emit(AuthErrorState(r)),
      );
    });
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoadingState());
      final response = await authRepository.register(formData: event.formData);

      response.fold(
        (l) {
          emit(RegisterSuccessState(l));
        },
        (r) => emit(AuthErrorState(r)),
      );
    });
    on<LoginStatusEvent>((event, emit) async {
      final store = await _secureService.getToken();

      if (store != null) {
        emit(const AuthSuccessState(UserModel()));
      } else {
        emit(const UnAuthenticatedState());
      }
    });
    on<LogoutEvent>((event, emit) async {
      emit(AuthLogoutLoadingState());
      await _secureService.deleteAll();
      await authRepository.logout();
      emit(AuthLogoutState());
    });
  }
  final _secureService = getIt<SecureStorage>();
  final AuthRepository authRepository;
}
