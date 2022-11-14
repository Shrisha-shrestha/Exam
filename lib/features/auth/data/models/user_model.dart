import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['access_token'] as String?,
        loginType: json['login_type'] as String?,
        imageBaseUrl: json['image_base_url'] as String?,
      );

  const UserModel(
      {this.user, this.accessToken, this.loginType, this.imageBaseUrl});
  final User? user;
  final String? accessToken;
  final String? loginType;
  final String? imageBaseUrl;

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'access_token': accessToken,
        'login_type': loginType,
        'image_base_url': imageBaseUrl,
      };

  @override
  List<Object?> get props => [user, accessToken];
}

class User extends Equatable {
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        phoneNo: json['phone_no'] as int?,
        email: json['email'] as String?,
        address: json['address'] as String?,
        dateofbirth: json['dateofbirth'] as String?,
        gender: json['gender'] as String?,
        status: json['status'] as dynamic,
        image: json['image'] as String?,
        comment: json['comment'] as String?,
        verificationCode: json['verification_code'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        roles: (json['roles'] as List<dynamic>?)
            ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  const User({
    this.id,
    this.name,
    this.slug,
    this.phoneNo,
    this.email,
    this.address,
    this.dateofbirth,
    this.gender,
    this.status,
    this.image,
    this.comment,
    this.verificationCode,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });
  final int? id;
  final String? name;
  final String? slug;
  final int? phoneNo;
  final String? email;
  final String? address;
  final String? dateofbirth;
  final String? gender;
  final dynamic status;
  final String? image;
  final String? comment;
  final dynamic verificationCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Role>? roles;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'phone_no': phoneNo,
        'email': email,
        'address': address,
        'dateofbirth': dateofbirth,
        'gender': gender,
        'status': status,
        'image': image,
        'comment': comment,
        'verification_code': verificationCode,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'roles': roles?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      slug,
      phoneNo,
      email,
      address,
      dateofbirth,
      gender,
      status,
      image,
      comment,
      verificationCode,
      createdAt,
      updatedAt,
      roles,
    ];
  }
}

class Role extends Equatable {
  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'] as int?,
        name: json['name'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        pivot: json['pivot'] == null
            ? null
            : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      );

  const Role({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'pivot': pivot?.toJson(),
      };

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt, pivot];
}

class Pivot extends Equatable {
  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json['user_id'] as int?,
        roleId: json['role_id'] as int?,
      );

  const Pivot({this.userId, this.roleId});
  final int? userId;
  final int? roleId;

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'role_id': roleId,
      };

  @override
  List<Object?> get props => [userId, roleId];
}
