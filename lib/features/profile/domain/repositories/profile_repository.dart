import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/features/auth/data/models/user_model.dart';
import 'package:creatu_exam/features/profile/data/models/about_us_model.dart';
import 'package:creatu_exam/features/profile/data/models/privacy_model.dart';

abstract class ProfileRepository {
  Future<Either<UserModel, ErrorModel>> getSetting();
  Future<Either<AboutUsModel, ErrorModel>> getAboutus();
  Future<Either<PrivacyModel, ErrorModel>> getPrivacy({
    required String endPoints,
    required String mapKey,
  });
  Future<Either<SuccessModel, ErrorModel>> updateProfile(
      {required FormData formData});

  Future<Either<UserModel, ErrorModel>> getProfile();
  Future<Either<SuccessModel, ErrorModel>> changePassword(
      {required FormData formData});
}
