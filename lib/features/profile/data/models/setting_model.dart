import 'package:equatable/equatable.dart';

class SettingModel extends Equatable {
  final int? id;
  final String? companyName;
  final String? email1;
  final String? contact1;
  final String? address;
  final String? googleLocation;
  final dynamic faxNo;
  final dynamic poBoxNo;
  final String? image;
  final String? facebookLink;
  final String? instaLink;
  final String? youtubeLink;
  final String? twitterLink;
  final String? linkedinLink;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SettingModel({
    this.id,
    this.companyName,
    this.email1,
    this.contact1,
    this.address,
    this.googleLocation,
    this.faxNo,
    this.poBoxNo,
    this.image,
    this.facebookLink,
    this.instaLink,
    this.youtubeLink,
    this.twitterLink,
    this.linkedinLink,
    this.createdAt,
    this.updatedAt,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json['id'] as int?,
        companyName: json['company_name'] as String?,
        email1: json['email1'] as String?,
        contact1: json['contact1'] as String?,
        address: json['address'] as String?,
        googleLocation: json['google_location'] as String?,
        faxNo: json['fax_no'] as dynamic,
        poBoxNo: json['po_box_no'] as dynamic,
        image: json['image'] as String?,
        facebookLink: json['facebook_link'] as String?,
        instaLink: json['insta_link'] as String?,
        youtubeLink: json['youtube_link'] as String?,
        twitterLink: json['twitter_link'] as String?,
        linkedinLink: json['linkedin_link'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'company_name': companyName,
        'email1': email1,
        'contact1': contact1,
        'address': address,
        'google_location': googleLocation,
        'fax_no': faxNo,
        'po_box_no': poBoxNo,
        'image': image,
        'facebook_link': facebookLink,
        'insta_link': instaLink,
        'youtube_link': youtubeLink,
        'twitter_link': twitterLink,
        'linkedin_link': linkedinLink,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      companyName,
      email1,
      contact1,
      address,
      googleLocation,
      faxNo,
      poBoxNo,
      image,
      facebookLink,
      instaLink,
      youtubeLink,
      twitterLink,
      linkedinLink,
      createdAt,
      updatedAt,
    ];
  }
}
