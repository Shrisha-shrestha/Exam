import 'package:bloc/bloc.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/features/auth/data/models/user_model.dart';
import 'package:creatu_exam/features/profile/data/models/privacy_model.dart';
import 'package:creatu_exam/features/profile/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

mixin PrivacyBloc on Bloc<ProfileEvent, ProfileState> {}
mixin ProfileUpdateBloc on Bloc<ProfileEvent, ProfileState> {}
mixin ChangePasswordBloc on Bloc<ProfileEvent, ProfileState> {}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>
    with ChangePasswordBloc, PrivacyBloc, ProfileUpdateBloc {
  ProfileBloc({required this.profileRepo}) : super(ProfileInitial()) {
    on<PrivacyEvent>((event, emit) async {
      emit(ProfileLoading());
      final _res = await profileRepo.getPrivacy(
        endPoints: event.endPoints,
        mapKey: event.key,
      );
      return _res.fold(
        (l) => emit(PrivacySuccessState(l)),
        (r) => emit(ProfileErrorState(r)),
      );
    });
    on<UpdateProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final _res = await profileRepo.updateProfile(
        formData: event.formData,
      );

      return _res.fold(
        (l) {
          emit(ProfileUpdateSuccess(l));
        },
        (r) => emit(ProfileErrorState(r)),
      );
    });
    on<ChangePasswordEvent>((event, emit) async {
      emit(ProfileLoading());
      final _res = await profileRepo.changePassword(
        formData: event.formData,
      );

      return _res.fold(
        (l) {
          emit(ProfileUpdateSuccess(l));
        },
        (r) => emit(ProfileErrorState(r)),
      );
    });
    on<FetchProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final _res = await profileRepo.getProfile();
      return _res.fold(
        (l) => emit(ProfileDataState(userData: l)),
        (r) => emit(ProfileErrorState(r)),
      );
    });
  }
  final ProfileRepository profileRepo;
}
