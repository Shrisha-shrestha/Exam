part of 'social_auth_bloc.dart';

abstract class SocialAuthEvent extends Equatable {
  const SocialAuthEvent();

  @override
  List<Object> get props => [];
}

class GoogleSingInEvent extends SocialAuthEvent {}

class FacebookSingInEvent extends SocialAuthEvent {}

class AppleSingInEvent extends SocialAuthEvent {}

// class LoginWithSocialDataLoginEvent extends SocialAuthEvent {
//   const LoginWithSocialDataLoginEvent(this.socialLoginModel);
//   final SocialLoginModel socialLoginModel;
// }
