import 'package:equatable/equatable.dart';

class AboutUsModel extends Equatable {
  final About? about;

  const AboutUsModel({this.about});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        about: json['about'] == null
            ? null
            : About.fromJson(json['about'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'about': about?.toJson(),
      };

  @override
  List<Object?> get props => [about];
}

class About extends Equatable {
  final int? id;
  final String? image;
  final String? description;
  final String? seoTitle;
  final String? seoKeyword;
  final String? seoDescription;
  final String? slug;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const About({
    this.id,
    this.image,
    this.description,
    this.seoTitle,
    this.seoKeyword,
    this.seoDescription,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
        id: json['id'] as int?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        seoTitle: json['seo_title'] as String?,
        seoKeyword: json['seo_keyword'] as String?,
        seoDescription: json['seo_description'] as String?,
        slug: json['slug'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'description': description,
        'seo_title': seoTitle,
        'seo_keyword': seoKeyword,
        'seo_description': seoDescription,
        'slug': slug,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      image,
      description,
      seoTitle,
      seoKeyword,
      seoDescription,
      slug,
      createdAt,
      updatedAt,
    ];
  }
}
