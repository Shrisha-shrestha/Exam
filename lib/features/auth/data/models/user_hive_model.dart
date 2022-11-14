// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// part 'user_hive_model.g.dart';

// @HiveType(typeId: 0)
// class UserHiveModel {
//   UserHiveModel({
//     required this.id,
//     this.name,
//     this.phoneNo,
//     this.email,
//     this.address,
//     this.dateofbirth,
//     this.status,
//     this.roles,
//     this.image,
//     this.loginType,
//   });
//   @HiveField(0)
//   int id;
//   @HiveField(1)
//   String? name;
//   @HiveField(2)
//   int? phoneNo;
//   @HiveField(3)
//   String? email;
//   @HiveField(4)
//   String? address;
//   @HiveField(5)
//   String? dateofbirth;
//   @HiveField(6)
//   String? status;
//   @HiveField(7)
//   String? image;
//   @HiveField(8)
//   String? loginType;
//   @HiveField(9)
//   List<RoleHiveModel>? roles;
// }

// @HiveType(typeId: 1)
// class RoleHiveModel {
//   RoleHiveModel({
//     this.id,
//     this.name,
//     this.pivot,
//   });
//   @HiveField(0)
//   int? id;
//   @HiveField(1)
//   String? name;
//   @HiveField(2)
//   PivotHiveModel? pivot;
//   // Hive fields go here
// }

// @HiveType(typeId: 2)
// class PivotHiveModel {
//   PivotHiveModel({
//     this.userId,
//     this.roleId,
//   });
//   @HiveField(0)
//   int? userId;
//   @HiveField(1)
//   int? roleId;
//   // Hive fields go here
// }
