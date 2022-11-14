import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/mixin/validation_mixin.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/forgot_password_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/pages/change_forgot_password.dart';
import 'package:creatu_exam/features/auth/presentation/pages/code_verify_page.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/app_button.dart';
import 'package:creatu_exam/widgets/app_textfield.dart';
import 'package:creatu_exam/widgets/custom_dialog.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordBloc>(),
      child: _ForgotPassword(),
    );
  }
}

class _ForgotPassword extends StatelessWidget with ValidationMixin {
  _ForgotPassword();

  String? _email;

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
                        'Forgot Password',
                        style: TextStyle(
                          fontFamily: AppStyles.kFontOpenSans,
                          fontSize: 26,
                          color: AppColors.kTextPrimaryColor,
                          letterSpacing: 1,
                        ),
                      ),
                      const Text(
                        'Please enter email associated with your account',
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
                        hintText: 'Enter Your Email Address',
                        titleText: 'Email Address',
                        onSaved: (value) => _email = value,
                        validator: validateEmail,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                        listener: (context, state) {
                          if (state is ForgotPasswordSuccess) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChangeForgotPassword(email: _email!);
                                },
                              ),
                            );
                          } else if (state is ForgotPasswordError) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialogBox(
                                  message: state.error.message ??
                                      state.error.customMessage ??
                                      '',
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
                              title: 'Forgot Password',
                              loading: state is ForgotPasswordLoading,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  context.read<ForgotPasswordBloc>().add(
                                        ForgotPasswordSendCodeEvent(
                                          formData: FormData.fromMap({
                                            'email': _email,
                                          }),
                                        ),
                                      );
                                }
                              },
                            ),
                          );
                        },
                      )
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
