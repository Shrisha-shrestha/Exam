import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  const ErrorModel({
    this.message,
    this.customMessage,
    this.dioStatus,
    this.errors,
    this.statusCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json['message'] as String?,
        customMessage: json['custom_message'] as String?,
        dioStatus: json['dio_status'] as int?,
        errors: json['errors'] == null
            ? null
            : Errors.fromJson(json['errors'] as Map<String, dynamic>),
        statusCode: json['status_code'] as int?,
      );
  final String? message;
  final String? customMessage;
  final int? dioStatus;
  final Errors? errors;
  final int? statusCode;

  Map<String, dynamic> toJson() => {
        'message': message,
        'custom_message': customMessage,
        'dio_status': dioStatus,
        'errors': errors?.toJson(),
        'status_code': statusCode,
      };

  @override
  List<Object?> get props {
    return [
      message,
      customMessage,
      dioStatus,
      errors,
      statusCode,
    ];
  }

  ErrorModel copyWith({
    String? message,
    String? customMessage,
    int? dioStatus,
    Errors? errors,
    int? statusCode,
  }) {
    return ErrorModel(
      message: message ?? this.message,
      customMessage: customMessage ?? this.customMessage,
      dioStatus: dioStatus ?? this.dioStatus,
      errors: errors ?? this.errors,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

class Errors extends Equatable {
  const Errors({this.email});

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json['email'] as List<String>?,
      );
  final List<String>? email;

  Map<String, dynamic> toJson() => {
        'email': email,
      };

  @override
  List<Object?> get props => [email];
}
