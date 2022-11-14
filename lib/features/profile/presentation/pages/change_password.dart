import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/loader/loading_screen.dart';
import 'package:creatu_exam/core/mixin/validation_mixin.dart';
import 'package:creatu_exam/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:creatu_exam/widgets/app_button.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/custom_form_textField.dart';
import 'package:creatu_exam/widgets/custom_snackbar.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChangePasswordBloc>(),
      child: const _ChangePassword(),
    );
  }
}

class _ChangePassword extends StatefulWidget {
  const _ChangePassword();

  @override
  State<_ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<_ChangePassword> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  bool oldP = true;
  bool newP = true;
  bool confrimP = true;

  String? oldPassword, newPassword, confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Change Password',
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  obscureText: oldP,
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      oldP = !oldP;
                      setState(() {});
                    },
                    icon: Icon(oldP ? Icons.visibility : Icons.visibility_off),
                  ),
                  hintText: 'Enter old Password',
                  titleText: 'Old Password',
                  onSaved: (v) => oldPassword = v,
                  validator: validatePassword,
                ),
                CustomFormTextField(
                  hintText: 'Enter New Password',
                  titleText: 'New Password',
                  textInputType: TextInputType.visiblePassword,
                  onSaved: (v) => newPassword = v,
                  validator: validatePassword,
                  obscureText: newP,
                  suffixIcon: IconButton(
                    onPressed: () {
                      newP = !newP;
                      setState(() {});
                    },
                    icon: Icon(newP ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                CustomFormTextField(
                  hintText: 'Enter Confrim New Password',
                  titleText: 'Confirm New Password',
                  textInputType: TextInputType.visiblePassword,
                  onSaved: (v) => confirmPassword = v,
                  validator: validatePassword,
                  obscureText: confrimP,
                  suffixIcon: IconButton(
                    onPressed: () {
                      confrimP = !confrimP;
                      setState(() {});
                    },
                    icon: Icon(
                      confrimP ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocListener<ChangePasswordBloc, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileLoading) {
                      LoadingScreen.instance()
                          .show(context: context, text: 'Loading');
                    } else if (state is ProfileUpdateSuccess) {
                      LoadingScreen.instance().hide();
                      showCustomFancyBar(
                        context: context,
                        error: false,
                        message: state.success.message ??
                            'Password Changed Successfully',
                      );
                    } else if (state is ProfileErrorState) {
                      LoadingScreen.instance().hide();

                      showCustomFancyBar(
                        context: context,
                        error: true,
                        message: state.error.message ?? 'Something Went Wrong',
                      );
                    }
                  },
                  child: AppButton(
                    title: 'Change Password',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final formData = FormData.fromMap({
                          'currentpassword': oldPassword,
                          'newpassword': newPassword,
                          'confirmpassword': confirmPassword,
                        });
                        context
                            .read<ChangePasswordBloc>()
                            .add(ChangePasswordEvent(formData: formData));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
