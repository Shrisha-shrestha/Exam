import 'package:equatable/equatable.dart';

class SuccessModel extends Equatable {
  const SuccessModel({this.status, this.message, this.statusCode});
  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        statusCode: json['status_code'] as int?,
      );
  final bool? status;
  final String? message;
  final int? statusCode;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'status_code': statusCode,
      };

  @override
  List<Object?> get props => [status, message, statusCode];
}
