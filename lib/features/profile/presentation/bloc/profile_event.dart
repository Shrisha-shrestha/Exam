part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class PrivacyEvent extends ProfileEvent {
  const PrivacyEvent({
    required this.endPoints,
    required this.key,
  });

  final String endPoints;
  final String key;
}

class UpdateProfileEvent extends ProfileEvent {
  const UpdateProfileEvent(this.formData);
  final FormData formData;
}

class FetchProfileEvent extends ProfileEvent {
  const FetchProfileEvent();
}

class ChangePasswordEvent extends ProfileEvent {
  const ChangePasswordEvent({
    required this.formData,
  });
  final FormData formData;
}
