// ignore_for_file: cascade_invocations

import 'package:creatu_exam/core/network/dio_service.dart';
import 'package:creatu_exam/core/storage/secure_storage.dart';
import 'package:creatu_exam/features/auth/data/models/user_hive_model.dart';
import 'package:creatu_exam/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:creatu_exam/features/auth/domain/repositories/auth_repository.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/forgot_password_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/social_auth/social_auth_bloc.dart';
import 'package:creatu_exam/features/exams/data/models/save_result_drift_model.dart';
import 'package:creatu_exam/features/exams/data/repositories/exam_repository_impl.dart';
import 'package:creatu_exam/features/exams/domain/repositories/exam_repository.dart';
import 'package:creatu_exam/features/exams/presentation/bloc/exams_bloc.dart';
import 'package:creatu_exam/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:creatu_exam/features/profile/domain/repositories/profile_repository.dart';
import 'package:creatu_exam/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:creatu_exam/res/app_string.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<SecureStorage>(SecureStorage());

  getIt.registerSingleton<DioService>(DioService());
  getIt.registerSingleton<MyExamDatabase>(MyExamDatabase());
  // getIt.registerSingleton<Box<UserHiveModel>>(
  //   Hive.box<UserHiveModel>(AppString.userBoxName),
  // );

  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(
      dioService: getIt<DioService>(),
    ),
  );
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      dioService: getIt<DioService>(),
    ),
  );

  //START :Profile DI
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      profileRepo: getIt<ProfileRepository>(),
    ),
  );
  getIt.registerFactory<PrivacyBloc>(
    () => ProfileBloc(
      profileRepo: getIt<ProfileRepository>(),
    ),
  );
  getIt.registerFactory<ProfileUpdateBloc>(
    () => ProfileBloc(
      profileRepo: getIt<ProfileRepository>(),
    ),
  );
  getIt.registerFactory<ChangePasswordBloc>(
    () => ProfileBloc(
      profileRepo: getIt<ProfileRepository>(),
    ),
  );
  //END :Profile DI
  getIt.registerFactory<ForgotPasswordBloc>(
    () => ForgotPasswordBloc(
      authRepo: getIt<AuthRepository>(),
    ),
  );

  //START : Social Login Auth
  getIt.registerFactory<SocialAuthBloc>(
    () => SocialAuthBloc(
      authRepository: getIt<AuthRepository>(),
    ),
  );
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt<AuthRepository>(),
    ),
  );
  getIt.registerFactory<RegisterBloc>(
    () => AuthBloc(
      authRepository: getIt<AuthRepository>(),
    ),
  );

  //END : Social Login Auth

  //exam di

  getIt.registerSingleton<ExamRepository>(
    ExamRepositoryImpl(
      dioService: getIt<DioService>(),
    ),
  );
  getIt.registerFactory<ExamsBloc>(
    () => ExamsBloc(
      examRepository: getIt<ExamRepository>(),
    ),
  );
  getIt.registerFactory<RegisterExamBloc>(
    () => ExamsBloc(
      examRepository: getIt<ExamRepository>(),
    ),
  );

  //end exam di

  await getIt.allReady();
}
