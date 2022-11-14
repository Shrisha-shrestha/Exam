import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/storage/secure_storage.dart';

class Logging extends Interceptor {
  Logging(this.dio);
  final Dio dio;
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log(
      'Error code: ${err.response?.statusCode} PATH: ${err.requestOptions.path} ERROR:$err ',
    );
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }
}

class AuthInterceptors extends Interceptor {
  AuthInterceptors(this.dio);
  final Dio dio;

  final _secureStorage = getIt<SecureStorage>();
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      'Accept': 'application/json',
    });

    if (options.headers['requiresToken'] == true) {
      //remove unrequired header
      options.headers.remove('requiresToken');
      final token = await _secureStorage.getToken();

      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    super.onRequest(options, handler);
  }
}
