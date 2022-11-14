import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/core/helper/custom_error_handling.dart';
import 'package:creatu_exam/core/network/api_endpoints.dart';
import 'package:creatu_exam/core/network/dio_service.dart';
import 'package:creatu_exam/core/network/network_type.dart';
import 'package:creatu_exam/features/auth/data/models/user_model.dart';
import 'package:creatu_exam/features/profile/data/models/about_us_model.dart';
import 'package:creatu_exam/features/profile/data/models/privacy_model.dart';
import 'package:creatu_exam/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl({required this.dioService});

  final DioService dioService;
  @override
  Future<Either<AboutUsModel, ErrorModel>> getAboutus() async {
    try {
      final _res = await dioService.apiCall(
        ApiEndPoints.aboutus,
        networkType: NetworkType.GET,
      );
      return _res.fold(
        (l) => Left(
          AboutUsModel.fromJson(l.data['data'] as Map<String, dynamic>),
        ),
        (e) => Right(e),
      );
    } catch (e) {
      return Right(
        ErrorModel(message: '$e'),
      );
    }
  }

  @override
  Future<Either<UserModel, ErrorModel>> getSetting() async {
    try {
      final _res = await dioService.apiCall(
        ApiEndPoints.aboutus,
        networkType: NetworkType.GET,
      );
      return _res.fold(
        (l) => Left(
          UserModel.fromJson(l.data as Map<String, dynamic>),
        ),
        Right.new,
      );
    } catch (e) {
      return Right(
        ErrorModel(message: '$e'),
      );
    }
  }

  @override
  Future<Either<PrivacyModel, ErrorModel>> getPrivacy({
    required String endPoints,
    required String mapKey,
  }) async {
    try {
      final _response = await dioService.apiCall(
        endPoints,
        networkType: NetworkType.GET,
      );
      return _response.fold(
        (l) => Left(
          PrivacyModel.fromJson(l.data['data'][mapKey] as Map<String, dynamic>),
        ),
        Right.new,
      );
    } catch (e) {
      return const Right(ErrorModel());
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> updateProfile({
    required FormData formData,
  }) async {
    try {
      final response = await dioService.apiCall(
        ApiEndPoints.updateProfile,
        networkType: NetworkType.POST,
        formData: formData,
      );
      return response.fold(
        (l) => Left(SuccessModel.fromJson(l.data as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(ErrorModel(message: '${DioExceptionError.fromDioError(e)}'));
    }
  }

  @override
  Future<Either<UserModel, ErrorModel>> getProfile() async {
    try {
      final response = await dioService.apiCall(
        ApiEndPoints.userProfile,
        networkType: NetworkType.GET,
      );
      return response.fold(
        (l) => Left(UserModel.fromJson(l.data['data'] as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(ErrorModel(message: '${DioExceptionError.fromDioError(e)}'));
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> changePassword({
    required FormData formData,
  }) async {
    try {
      final response = await dioService.apiCall(
        ApiEndPoints.changePassword,
        networkType: NetworkType.POST,
        formData: formData,
      );
      return response.fold(
        (l) => Left(SuccessModel.fromJson(l.data as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(ErrorModel(message: '${DioExceptionError.fromDioError(e)}'));
    }
  }
}
