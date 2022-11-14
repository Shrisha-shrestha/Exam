import 'dart:io';

import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/helper/helper.dart';
import 'package:creatu_exam/core/loader/loading_screen.dart';
import 'package:creatu_exam/core/mixin/validation_mixin.dart';
import 'package:creatu_exam/features/auth/data/models/user_hive_model.dart';
import 'package:creatu_exam/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/custom_decoratedbox.dart';
import 'package:creatu_exam/widgets/custom_dialog.dart';
import 'package:creatu_exam/widgets/custom_error_widget.dart';
import 'package:creatu_exam/widgets/custom_form_textField.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Update Profile',
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<ProfileBloc>()..add(const FetchProfileEvent()),
          ),
          BlocProvider(
            create: (context) => getIt<ProfileUpdateBloc>(),
          ),
        ],
        child: const UpdateProfileView(),
      ),
    );
  }
}

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _controller;
  late final TextEditingController _dateTextEditingController;
  final _imageNotifier = ValueNotifier<File?>(null);
  final _genderNotifier = ValueNotifier<String>('Male');

  String? name, email, dateofbirth, address, phone;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _dateTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileUpdateBloc, ProfileState>(
      listener: (context, updateState) {
        if (updateState is ProfileLoading) {
          LoadingScreen.instance().show(context: context, text: 'Loading');
        } else if (updateState is ProfileErrorState) {
          LoadingScreen.instance().hide();
          showDialog(
            context: context,
            builder: (context) => CustomDialogBox(
              message: updateState.error.message ?? '',
            ),
          );
        } else if (updateState is ProfileUpdateSuccess) {
          LoadingScreen.instance().hide();
          // final userData = getIt<Box<UserHiveModel>>().get(
          //   'user',
          // );
          // getIt<Box<UserHiveModel>>().put(
          //   'user',
          //   UserHiveModel(
          //     id: userData?.id ?? 0,
          //     email: userData?.email ?? '',
          //     name: name ?? '',
          //     image: userData?.image,
          //     loginType: userData?.loginType,
          //   ),
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(updateState.success.message ?? '')),
          );
        }
      },
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileDataState) {
            _dateTextEditingController.text =
                state.userData.user?.dateofbirth ?? '';
            _controller.text = state.userData.user?.image ?? '';
            _genderNotifier.value = state.userData.user?.gender ?? '';
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileDataState) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        titleText: 'Name',
                        hintText: 'Enter Your Name',
                        onSaved: (v) => name = v,
                        initialValue: state.userData.user?.name,
                        validator: validateRequired,
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      CustomFormTextField(
                        titleText: 'Phone',
                        hintText: 'Enter Your Phone',
                        onSaved: (v) => phone = v,
                        initialValue: '${state.userData.user?.phoneNo ?? ''}',
                        validator: validateRequired,
                        textInputAction: TextInputAction.next,
                        // textInputType: TextInputType.phone,
                      ),
                      const Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppStyles.kMonoSerrat,
                          color: AppColors.kTextPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      ValueListenableBuilder(
                        valueListenable: _genderNotifier,
                        builder: (context, _, __) {
                          return CustomDecoratedBox(
                            color: AppColors.kPrimaryColor.withOpacity(0.1),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      _genderNotifier.value = 'Male';
                                    },
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 'Male',
                                          groupValue: _genderNotifier.value,
                                          onChanged: (_) {},
                                        ),
                                        const Text('Male')
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      _genderNotifier.value = 'Female';
                                    },
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 'Female',
                                          groupValue: _genderNotifier.value,
                                          onChanged: (_) {},
                                        ),
                                        const Text('Female')
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      CustomFormTextField(
                        titleText: 'Address',
                        hintText: 'Enter Your Address',
                        onSaved: (v) => address = v,
                        initialValue: state.userData.user?.address ?? '',
                        validator: validateRequired,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.streetAddress,
                      ),
                      CustomFormTextField(
                        titleText: 'DOB',
                        hintText: 'Enter Your DOB',
                        readOnly: true,
                        onTap: () async {
                          final dob = await Helper.getNepaliDate(context);
                          _dateTextEditingController.text = dob ?? '';
                        },
                        onSaved: (v) => dateofbirth = v,
                        textEditingController: _dateTextEditingController,
                        validator: validateRequired,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.streetAddress,
                      ),
                      CustomFormTextField(
                        titleText: 'Profile Image',
                        hintText: 'Enter Your Image',
                        readOnly: true,
                        onTap: () async {
                          final image = await Helper.getImage();
                          _controller.text =
                              (image?.path ?? '').split('/').last;
                          _imageNotifier.value = image;
                        },
                        textEditingController: _controller,
                        textInputAction: TextInputAction.done,
                      ),
                      ValueListenableBuilder(
                        valueListenable: _imageNotifier,
                        builder: (context, _, __) {
                          if (_imageNotifier.value == null) {
                            return Image.network(
                              '${state.userData.imageBaseUrl}/${state.userData.user?.image}',
                              height: 0.25.sh,
                            );
                          }
                          if (_imageNotifier.value != null) {
                            return Image.file(
                              _imageNotifier.value!,
                              height: 0.25.sh,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final formData = FormData.fromMap({
                              'name': name,
                              'gender': _genderNotifier.value,
                              'dateofbirth': _dateTextEditingController.text,
                              'address': address,
                              'phone': phone,
                            });
                            if (_imageNotifier.value != null) {
                              formData.files.add(
                                MapEntry(
                                  'image',
                                  await MultipartFile.fromFile(
                                    _imageNotifier.value!.path,
                                    filename: _imageNotifier.value!.path
                                        .split('/')
                                        .last,
                                  ),
                                ),
                              );
                            }

                            context
                                .read<ProfileUpdateBloc>()
                                .add(UpdateProfileEvent(formData));
                          }
                        },
                        child: const Text('Update Profile'),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (state is ProfileErrorState) {
            return Center(
              child: CustomErrorWidget(
                message: '${state.error.message}',
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
