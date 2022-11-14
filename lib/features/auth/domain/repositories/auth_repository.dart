import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/features/auth/data/models/register_model.dart';
import 'package:creatu_exam/features/auth/data/models/social_login_model.dart';
import 'package:creatu_exam/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<UserModel, ErrorModel>> login({required FormData formData});
  Future<Either<UserModel, ErrorModel>> loginWithSocialData(
      {required SocialLoginModel socialData});
  Future<Either<SocialLoginModel, ErrorModel>> googleSignIn();
  Future<Either<SocialLoginModel, ErrorModel>> facebookSignIn();
  Future<Either<SuccessModel, ErrorModel>> register(
      {required FormData formData});
  Future<Either<SuccessModel, ErrorModel>> sendCode({
    required FormData formData,
  });
  Future<Either<SuccessModel, ErrorModel>> verifyCode({
    required FormData formData,
  });
  Future<Either<SuccessModel, ErrorModel>> changePassword({
    required FormData formData,
  });

  Future<Either<SuccessModel, ErrorModel>> logout();
}
