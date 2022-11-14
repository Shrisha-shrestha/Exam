import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/features/auth/data/models/social_login_model.dart';
import 'package:creatu_exam/features/auth/domain/repositories/auth_repository.dart';

part 'social_auth_event.dart';
part 'social_auth_state.dart';

class SocialAuthBloc extends Bloc<SocialAuthEvent, SocialAuthState> {
  SocialAuthBloc({required this.authRepository}) : super(SocialAuthInitial()) {
    on<SocialAuthEvent>((event, emit) async {
      final response = await authRepository.googleSignIn();
      response.fold(
        (l) => emit(SocialSignInSuccessState(l)),
        (r) => emit(
          SoicalAuthErrorState(r),
        ),
      );
    });
  }
  final AuthRepository authRepository;
}
