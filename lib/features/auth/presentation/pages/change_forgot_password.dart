import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/mixin/validation_mixin.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/forgot_password_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/pages/login.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/app_button.dart';
import 'package:creatu_exam/widgets/app_textfield.dart';
import 'package:creatu_exam/widgets/custom_dialog.dart';
import 'package:creatu_exam/widgets/custom_snack_bar.dart';

class ChangeForgotPassword extends StatelessWidget {
  const ChangeForgotPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordBloc>(),
      child: _ChangeForgotPassword(
        email: email,
      ),
    );
  }
}

class _ChangeForgotPassword extends StatelessWidget with ValidationMixin {
  _ChangeForgotPassword({required this.email});

  String? _newPassword, _newPasswordConfirm, _code;

  final String email;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                fit: BoxFit.cover,
                child: SvgPicture.asset(
                  'assets/svg/auth_backgound.svg',
                ),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 0.1.sh,
                      ),
                      const Text(
                        'Change Forgot Password',
                        style: TextStyle(
                          fontFamily: AppStyles.kFontOpenSans,
                          fontSize: 26,
                          color: AppColors.kTextPrimaryColor,
                          letterSpacing: 1,
                        ),
                      ),
                      const Text(
                        'Set an new password',
                        style: TextStyle(
                          fontFamily: AppStyles.kFontOpenSans,
                          fontSize: 16,
                          color: AppColors.kTextPrimaryColor,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: 0.07.sh,
                      ),
                      creatu_examTextField(
                        hintText: 'Enter Code',
                        titleText: 'Code',
                        onSaved: (value) => _code = value,
                        validator: validateRequired,
                        textInputAction: TextInputAction.next,
                      ),
                      creatu_examTextField(
                        hintText: 'Enter New Password',
                        titleText: 'New Password',
                        onSaved: (value) => _newPassword = value,
                        validator: validatePassword,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      creatu_examTextField(
                        hintText: 'Enter Password To Confirm',
                        titleText: 'Enter Confirm Password',
                        onSaved: (value) => _newPasswordConfirm = value,
                        validator: validatePassword,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                        listener: (context, state) {
                          if (state is ForgotPasswordSuccess) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (route) => true,
                            );
                          } else if (state is ForgotPasswordError) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialogBox(
                                  message: state.error.message ?? '',
                                );
                              },
                            );
                          }
                        },
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            child: AppButton(
                              loading: state is ForgotPasswordLoading,
                              title: 'Change Password',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  if (_newPassword != _newPasswordConfirm) {
                                    showCustomSnackBar(
                                      context: context,
                                      snackBarColor: AppColors.kErrorColor,
                                      message:
                                          "New Password and Confirm Password doesn't match",
                                    );
                                    return;
                                  }
                                  context.read<ForgotPasswordBloc>().add(
                                        ForgotPasswordChangePassword(
                                          formData: FormData.fromMap({
                                            'email': email,
                                            'otp': _code,
                                            'password': _newPassword,
                                            'password_confirmation':
                                                _newPasswordConfirm,
                                          }),
                                        ),
                                      );
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
