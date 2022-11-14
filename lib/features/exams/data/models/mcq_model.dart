import 'package:equatable/equatable.dart';

class McqModel extends Equatable {
  final int? id;
  final String? mcqPackageTitle;
  final String? mcqPackageSlug;
  final int? mcqPackagePrice;
  final int? mcqPackageNewPrice;
  final int? mcqPackageValidity;
  final int? mcqPackageNewValidity;
  final String? mcqPackageImage;
  final String? mcqPackageVideoUrl;
  final String? mcqPackageDescription;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const McqModel({
    this.id,
    this.mcqPackageTitle,
    this.mcqPackageSlug,
    this.mcqPackagePrice,
    this.mcqPackageNewPrice,
    this.mcqPackageValidity,
    this.mcqPackageNewValidity,
    this.mcqPackageImage,
    this.mcqPackageVideoUrl,
    this.mcqPackageDescription,
    this.createdAt,
    this.updatedAt,
  });

  factory McqModel.fromJson(Map<String, dynamic> json) => McqModel(
        id: json['id'] as int?,
        mcqPackageTitle: json['mcq_package_title'] as String?,
        mcqPackageSlug: json['mcq_package_slug'] as String?,
        mcqPackagePrice: json['mcq_package_price'] as int?,
        mcqPackageNewPrice: json['mcq_package_new_price'] as int?,
        mcqPackageValidity: json['mcq_package_validity'] as int?,
        mcqPackageNewValidity: json['mcq_package_new_validity'] as int?,
        mcqPackageImage: json['mcq_package_image'] as String?,
        mcqPackageVideoUrl: json['mcq_package_video_url'] as String?,
        mcqPackageDescription: json['mcq_package_description'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'mcq_package_title': mcqPackageTitle,
        'mcq_package_slug': mcqPackageSlug,
        'mcq_package_price': mcqPackagePrice,
        'mcq_package_new_price': mcqPackageNewPrice,
        'mcq_package_validity': mcqPackageValidity,
        'mcq_package_new_validity': mcqPackageNewValidity,
        'mcq_package_image': mcqPackageImage,
        'mcq_package_video_url': mcqPackageVideoUrl,
        'mcq_package_description': mcqPackageDescription,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      mcqPackageTitle,
      mcqPackageSlug,
      mcqPackagePrice,
      mcqPackageNewPrice,
      mcqPackageValidity,
      mcqPackageNewValidity,
      mcqPackageImage,
      mcqPackageVideoUrl,
      mcqPackageDescription,
      createdAt,
      updatedAt,
    ];
  }
}
