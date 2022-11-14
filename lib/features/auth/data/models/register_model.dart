import 'package:equatable/equatable.dart';
import 'package:creatu_exam/features/auth/data/models/user_model.dart';

class RegisterModel extends Equatable {
  final bool? status;
  final String? message;
  final int? statusCode;
  final UserModel? data;

  const RegisterModel({
    this.status,
    this.message,
    this.statusCode,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        statusCode: json['status_code'] as int?,
        data: json['data']['user'] == null
            ? null
            : UserModel.fromJson(json['data']['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'status_code': statusCode,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, statusCode, data];
}
