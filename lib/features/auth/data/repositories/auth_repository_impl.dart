// ignore_for_file: avoid_dynamic_calls

import 'package:creatu_exam/features/exams/data/models/save_result_drift_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/error/error_handler.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/core/helper/custom_error_handling.dart';
import 'package:creatu_exam/core/network/api_endpoints.dart';
import 'package:creatu_exam/core/network/dio_service.dart';
import 'package:creatu_exam/core/network/network_type.dart';
import 'package:creatu_exam/features/auth/data/models/social_login_model.dart';
import 'package:creatu_exam/features/auth/data/models/user_hive_model.dart';
import 'package:creatu_exam/features/auth/data/models/user_model.dart';
import 'package:creatu_exam/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.dioService});
  final DioService dioService;
  @override
  Future<Either<UserModel, ErrorModel>> login({
    required FormData formData,
  }) async {
    try {
      final _response = await dioService.apiCall(
        ApiEndPoints.login,
        networkType: NetworkType.POST,
        formData: formData,
        tokenRequired: false,
      );

      return _response.fold(
        (l) => Left(UserModel.fromJson(l.data['data'] as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(
        ErrorModel(message: '${DioExceptionError.fromDioError(e)}'),
      );
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> register({
    required FormData formData,
  }) async {
    try {
      final _response = await dioService.apiCall(
        ApiEndPoints.register,
        networkType: NetworkType.POST,
        formData: formData,
        tokenRequired: false,
      );

      return _response.fold(
        (l) => Left(
          SuccessModel.fromJson(l.data['data'] as Map<String, dynamic>),
        ),
        Right.new,
      );
    } catch (e) {
      print(e);
      return Right(
        ErrorModel(message: '${DioExceptionError.fromDioError(e)}'),
      );
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> changePassword({
    required FormData formData,
  }) async {
    try {
      final _response = await dioService.apiCall(
        ApiEndPoints.resetPassword,
        networkType: NetworkType.POST,
        formData: formData,
        tokenRequired: false,
      );

      return _response.fold(
        (l) => Left(SuccessModel.fromJson(l.data as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(
        ErrorModel(customMessage: '${DioExceptionError.fromDioError(e)}'),
      );
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> sendCode({
    required FormData formData,
  }) async {
    try {
      final _response = await dioService.apiCall(
        ApiEndPoints.sendVerificationCode,
        networkType: NetworkType.POST,
        formData: formData,
        tokenRequired: false,
      );
      print(_response);
      return _response.fold(
        (l) => Left(SuccessModel.fromJson(l.data as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(
        ErrorModel(customMessage: '${DioExceptionError.fromDioError(e)}'),
      );
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> verifyCode({
    required FormData formData,
  }) async {
    try {
      final _response = await dioService.apiCall(
        ApiEndPoints.checkVerificationCode,
        networkType: NetworkType.POST,
        formData: formData,
        tokenRequired: false,
      );

      return _response.fold(
        (l) => Left(
          SuccessModel.fromJson(
            l.data as Map<String, dynamic>,
          ),
        ),
        Right.new,
      );
    } catch (e) {
      return Right(ErrorModel(message: '${DioExceptionError.fromDioError(e)}'));
    }
  }

  @override
  Future<Either<SocialLoginModel, ErrorModel>> googleSignIn() async {
    try {
      final data = await GoogleSignIn().signIn();
      return Left(
        SocialLoginModel(
          email: data?.email,
          name: data?.displayName,
          id: data?.id,
          token: data?.serverAuthCode,
          loginType: 'google',
        ),
      );
    } catch (e) {
      return Right(ErrorModel(message: '$e'));
    }
  }

  @override
  Future<Either<UserModel, ErrorModel>> loginWithSocialData({
    required SocialLoginModel socialData,
  }) async {
    try {
      final _response = await dioService.apiCall(
        ApiEndPoints.login,
        networkType: NetworkType.POST,
        formData: FormData.fromMap({
          'login_type': socialData.loginType,
          'name': socialData.name,
          'id': socialData.id,
          'token': socialData.token,
          'email': socialData.email,
          'phone_no': socialData.phoneNo,
        }),
        tokenRequired: false,
      );

      return _response.fold(
        (l) => Left(UserModel.fromJson(l.data['data'] as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(
        ErrorModel(customMessage: '${DioExceptionError.fromDioError(e)}'),
      );
    }
  }

  @override
  Future<Either<SocialLoginModel, ErrorModel>> facebookSignIn() async {
    try {
      final _auth = FacebookAuth.instance;
      final loginResult = await _auth.login();
      if (loginResult.status == LoginStatus.success) {
        final data = await _auth.getUserData();
        return Left(
          SocialLoginModel(
            email: '${data['email']}',
            id: '${data['id']}',
            name: '${data['name']}',
            token: loginResult.accessToken?.token,
            loginType: 'facebook',
          ),
        );
      } else {
        return const Right(ErrorModel(message: 'Something Went Wrong'));
      }
    } catch (e) {
      return Right(ErrorModel(message: '${DioExceptionError.fromDioError(e)}'));
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> logout() async {
    // final userData = getIt<Box<UserHiveModel>>().get('user');
    // final loginType = userData?.loginType;

    final loginType = (await getIt<MyExamDatabase>().getUserF())?.loginType;
    try {
      if (loginType == 'facebook') {
        await FacebookAuth.instance.logOut();
      } else if (loginType == 'google') {
        await GoogleSignIn().signOut();
      } else if (loginType == 'apple') {}
      return const Left(SuccessModel());
    } catch (e) {
      return Right(ErrorModel(message: '${DioExceptionError.fromDioError(e)}'));
    }
  }
}
