import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class DioExceptionError implements Exception {
  DioExceptionError.fromDioError(dioError) {
    print('dioError.runtimeType');
    print(dioError.runtimeType);
    if (dioError is Exception) {
      if (dioError is DioError) {
        // if (dioError.response?.data != null) {
        //   ErrorModel.fromJson(dioError.response?.data as Map<String,dynamic>);
        // }

        switch (dioError.type) {
          case DioErrorType.cancel:
            message = 'Request  was cancelled';
            break;
          case DioErrorType.connectTimeout:
            message = 'CONNECTION TIMEOUT';
            break;
          case DioErrorType.other:
            if (dioError.error is SocketException) {
              message = 'NO INTERNET CONNECTION';
              break;
            } else if (dioError.error is FormatException) {
              message = 'Internal Server Error';
              break;
            }
            message = 'FAILED DUE TO INTERNET CONNECTION';
            break;
          case DioErrorType.receiveTimeout:
            message = 'Receive timeout in connection ';
            break;
          case DioErrorType.response:
            message = _handleError(dioError.response?.statusCode ?? 500);
            break;
          case DioErrorType.sendTimeout:
            message = 'Send timeout in connection';
            break;
          default:
            message = 'Something went wrong';
            break;
        }
      } else if (dioError is SocketException) {
        message = 'No Internet Connection';
      } else if (dioError is FormatException) {
        message = 'Format Exception';
      } else if (dioError is TimeoutException) {
        message = 'Timeout Exception';
      } else {
        message = 'Unexcepted Error Occured';
      }
    } else {
      if (dioError.toString().contains('is not a subtype of')) {
        message = '$dioError';
      } else {
        message = 'Unexpected Error';
      }
    }
  }

  String message = '';

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Unauthorised request';

      case 401:
        return 'Unauthorised request';
      case 403:
        return 'Unauthorised request';
      case 404:
        return '404 | Not Found \n Inforamtion is Not Found';
      case 409:
        return 'Error due to conflict';
      case 408:
        return 'Connection request timeout';
      case 500:
        return 'Something Went Wrong ';
      case 503:
        return 'Service Unavailable';
      default:
        return 'Something Went Wrong ';
    }
  }

  @override
  String toString() => message;
}
