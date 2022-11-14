import 'package:creatu_exam/core/mixin/validation_mixin.dart';
import 'package:creatu_exam/features/Auth/presentation/pages/register.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/social_auth/social_auth_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/pages/forgot_password.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/app_button.dart';
import 'package:creatu_exam/widgets/app_textfield.dart';
import 'package:creatu_exam/widgets/social_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  String? email, password;

  final _viewPassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _viewPassword.dispose();
    super.dispose();
  }

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
                      height: 0.1.sh,
                    ),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontFamily: AppStyles.kFontOpenSans,
                        fontSize: 26,
                        color: AppColors.kTextPrimaryColor,
                        letterSpacing: 1,
                      ),
                    ),
                    const Text(
                      'Login To Your Acount',
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
                      initialValue: kDebugMode ? 'bibmak@yopmail.com' : null,
                      onSaved: (value) => email = value,
                      validator: validateEmail,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 6.sp,
                    ),
                    ValueListenableBuilder(
                      valueListenable: _viewPassword,
                      builder: (_, value, ___) {
                        return creatu_examTextField(
                          hintText: 'Enter your password',
                          titleText: 'Password',
                          initialValue: kDebugMode ? '12345678' : null,
                          onSaved: (value) => password = value,
                          validator: validatePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: _viewPassword.value,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _viewPassword.value = !_viewPassword.value;
                            },
                            icon: Icon(
                              _viewPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const ForgotPasswordPage();
                            },
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 2,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              color: AppColors.kDarkGreyColor,
                              fontFamily: AppStyles.kMonoSerrat,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return AppButton(
                            title: 'Log In',
                            loading: state is AuthLoadingState,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                context.read<AuthBloc>().add(
                                      LoginEvent(
                                        FormData.fromMap({
                                          'email': email,
                                          'password': password,
                                        }),
                                      ),
                                    );
                              }
                            },
                          );
                        },
                      ),
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
                              'Or continue with',
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
                      height: 15.sp,
                    ),
                    const SocialWidget(),
                    SizedBox(
                      height: 20.sp,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
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
                                text: 'Not a member?',
                                style: TextStyle(
                                  color: AppColors.kDarkGreyColor,
                                  fontFamily: AppStyles.kMonoSerrat,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: ' Register Now ',
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
                    )
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

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialAuthBloc, SocialAuthState>(
      listener: (context, state) {
        if (state is SocialSignInSuccessState) {
          final data = state.userData;
          context.read<AuthBloc>().add(
                LoginEvent(
                  FormData.fromMap({
                    'login_type': data.loginType,
                    'name': data.name,
                    'id': data.id,
                    'token': data.token,
                    'email': data.email,
                    'phone_no': '',
                  }),
                ),
              );
        }
      },
      child: Row(
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
    );
  }
}
