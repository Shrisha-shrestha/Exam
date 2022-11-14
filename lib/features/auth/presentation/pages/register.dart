import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:creatu_exam/core/mixin/validation_mixin.dart';
import 'package:creatu_exam/features/Auth/presentation/pages/login.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/app_button.dart';
import 'package:creatu_exam/widgets/app_textfield.dart';
import 'package:creatu_exam/widgets/custom_dialog.dart';
import 'package:creatu_exam/widgets/custom_snack_bar.dart';
import 'package:creatu_exam/widgets/social_button.dart';

import '../bloc/social_auth/social_auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ValidationMixin {
  String? _email, _password, _confirmPassword, _name, _phoneNumber;

  final _formKey = GlobalKey<FormState>();

  String? _confirmPasswordError;

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.07.sh,
                    ),
                    const Text(
                      'Hello',
                      style: TextStyle(
                        fontFamily: AppStyles.kFontOpenSans,
                        fontSize: 20,
                        color: AppColors.kTextPrimaryColor,
                        letterSpacing: 1,
                      ),
                    ),
                    const Text(
                      'Sign Up as a Member',
                      style: TextStyle(
                        fontFamily: AppStyles.kFontOpenSans,
                        fontSize: 14,
                        color: AppColors.kTextPrimaryColor,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 0.04.sh,
                    ),
                    creatu_examTextField(
                      hintText: 'Enter Your Email Address',
                      titleText: 'Email Address',
                      onSaved: (v) => _email = v,
                      validator: validateEmail,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    creatu_examTextField(
                      hintText: 'Enter Your Name',
                      titleText: 'Name',
                      onSaved: (v) => _name = v,
                      validator: validateName,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    // creatu_examTextField(
                    //   hintText: 'Enter Your Phone Number',
                    //   titleText: 'Phone Number',
                    //   onSaved: (v) => _phoneNumber = v,
                    //   validator: validateName,
                    //   textInputType: TextInputType.phone,
                    //   textInputAction: TextInputAction.next,
                    // ),
                    SizedBox(
                      height: 4.sp,
                    ),
                    creatu_examTextField(
                      hintText: 'Create your password',
                      titleText: 'Create Password',
                      onSaved: (v) => _password = v,
                      validator: validatePassword,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 4.sp,
                    ),
                    creatu_examTextField(
                      hintText: 'Confirm your password',
                      titleText: 'Confirm Password',
                      onSaved: (v) => _confirmPassword = v,
                      validator: validatePassword,
                      errorText: _confirmPasswordError,
                      textInputAction: TextInputAction.done,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 2,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'By signing up,you are agreeing to the ',
                                style: TextStyle(
                                  color: AppColors.kDarkGreyColor,
                                  fontFamily: AppStyles.kMonoSerrat,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: ' Terms and Condition',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.kTextPrimaryColor,
                                  fontFamily: AppStyles.kFontOpenSans,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const TextSpan(
                                text: ' and',
                                style: TextStyle(
                                  color: AppColors.kDarkGreyColor,
                                  fontFamily: AppStyles.kMonoSerrat,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: ' Privacy Policy',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                style: const TextStyle(
                                  color: AppColors.kTextPrimaryColor,
                                  fontFamily: AppStyles.kFontOpenSans,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    BlocConsumer<RegisterBloc, AuthState>(
                      listener: (context, s) {
                        if (s is RegisterSuccessState) {
                          showCustomSnackBar(
                            context: context,
                            message:
                                '${s.registerData.message ?? ''} Please Check your email to verify ',
                          );
                          Navigator.pop(context);
                        } else if (s is AuthErrorState) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return CustomDialogBox(
                                message: s.error.message ?? '',
                                statusCode: s.error.statusCode,
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
                            loading: state is AuthLoadingState,
                            title: 'Sign Up',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                if (_confirmPassword != _password) {
                                  setState(() {
                                    _confirmPasswordError =
                                        "Confrim Password and Password doesn't match";
                                  });
                                  return;
                                } else {
                                  setState(() {
                                    _confirmPasswordError = null;
                                  });

                                  context.read<RegisterBloc>().add(
                                        RegisterEvent(
                                          FormData.fromMap({
                                            'email': _email,
                                            'name': _name,
                                            'password': _password,
                                            'confirm_password':
                                                _confirmPassword,
                                          }),
                                        ),
                                      );
                                }
                              }
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 0.05.sh,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: SizedBox(
                              height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Text(
                              'Or register with',
                              style: TextStyle(
                                color: AppColors.kDarkGreyColor,
                                fontFamily: AppStyles.kMonoSerrat,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SocialIconButton(
                        //   logo: 'assets/icons/apple_logo.png',
                        //   onPressed: () {},
                        // ),
                        SocialIconButton(
                          logo: 'assets/icons/google_logo.png',
                          onPressed: () {
                                          context.read<SocialAuthBloc>().add(GoogleSingInEvent());

                          },
                        ),
                        // SocialIconButton(
                        //   logo: 'assets/icons/fb_logo.png',
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already a Member ?',
                                style: TextStyle(
                                  color: AppColors.kDarkGreyColor,
                                  fontFamily: AppStyles.kMonoSerrat,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: ' Login Now',
                                style: TextStyle(
                                  color: AppColors.kTextPrimaryColor,
                                  fontFamily: AppStyles.kFontOpenSans,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
