import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/helper/custom_error_handling.dart';
import 'package:creatu_exam/core/network/api_endpoints.dart';
import 'package:creatu_exam/core/network/interceptors.dart';
import 'package:creatu_exam/core/network/network_type.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioService {
  final dio = createDio();
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        receiveTimeout: 20000,
        connectTimeout: 20000,
        sendTimeout: 20000,
      ),
    );
    dio.interceptors.addAll([AuthInterceptors(dio)]);
    dio.interceptors.add(
      Logging(dio),
    );
    return dio;
  }

  Future<Either<Response, ErrorModel>> apiCall(
    String endPoints, {
    required NetworkType networkType,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    bool tokenRequired = true,
    // required T Function(Map<String, dynamic>) converter,
    FormData? formData,
  }) async {
    late final Options options;
    if (tokenRequired) {
      options = Options(headers: {'requiresToken': true});
    } else {
      options = Options(headers: {'requiresToken': false});
    }
    try {
      switch (networkType) {
        case NetworkType.GET:
          final response = await dio.get(
            endPoints,
            options: options,
          );

          return Left(response);

        case NetworkType.POST:
          final response = await dio.post(
            endPoints,
            data: formData,
            options: options,
          );
          return Left(response);
        case NetworkType.PUT:
          final response = await dio.put(
            endPoints,
            options: options,
          );

          return Left(response);
        case NetworkType.PATCH:
          final response = await dio.patch(
            endPoints,
            data: formData,
          );

          return Left(response);
        case NetworkType.DELETE:
          final response = await dio.delete(
            endPoints,
            options: options,
          );

          return Left(response);
      }
    } on DioError catch (dioError) {
      if (dioError.response?.data != null) {
        final dioErrorData = dioError.response?.data ?? <String, dynamic>{};
        return Right(
          ErrorModel.fromJson(dioErrorData as Map<String, dynamic>).copyWith(
            dioStatus: dioError.response?.statusCode,
            customMessage: dioError.response?.statusMessage,
          ),
        );
      }
      return Right(
        ErrorModel(
          message: '${DioExceptionError.fromDioError(dioError)}',
        ),
      );
    } catch (e) {
      return Right(
        ErrorModel(
          message: '${DioExceptionError.fromDioError(e)}',
        ),
      );
    }
  }
}
