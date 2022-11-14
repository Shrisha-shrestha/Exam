import 'package:equatable/equatable.dart';

class SocialLoginModel extends Equatable {
  final String? loginType;
  final String? name;
  final String? id;
  final String? token;
  final String? email;
  final int? phoneNo;

  const SocialLoginModel({
    this.loginType,
    this.name,
    this.id,
    this.token,
    this.email,
    this.phoneNo,
  });

  factory SocialLoginModel.fromJson(Map<String, dynamic> json) {
    return SocialLoginModel(
      loginType: json['login_type'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      token: json['token'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phone_no'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'login_type': loginType,
        'name': name,
        'id': id,
        'token': token,
        'email': email,
        'phone_no': phoneNo,
      };

  @override
  List<Object?> get props => [loginType, name, id, token, email, phoneNo];
}
