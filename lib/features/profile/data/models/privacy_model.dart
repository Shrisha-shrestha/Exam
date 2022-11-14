import 'package:equatable/equatable.dart';

class PrivacyModel extends Equatable {
  final int? id;
  final String? description;
  final String? seoKeyword;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PrivacyModel({
    this.id,
    this.description,
    this.seoKeyword,
    this.createdAt,
    this.updatedAt,
  });

  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
        id: json['id'] as int?,
        description: json['description'] as String?,
        seoKeyword: json['seo_keyword'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'seo_keyword': seoKeyword,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      description,
      seoKeyword,
      createdAt,
      updatedAt,
    ];
  }
}
