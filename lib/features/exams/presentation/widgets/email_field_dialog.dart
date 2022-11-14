import 'dart:developer';

import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/mixin/validation_mixin.dart';
import 'package:creatu_exam/features/exams/data/models/save_result_drift_model.dart'
    as localdb;
import 'package:creatu_exam/features/exams/presentation/bloc/exams_bloc.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/widgets/custom_form_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckEmailDialog extends StatefulWidget {
  const CheckEmailDialog({super.key, required this.examId});

  final int examId;

  @override
  State<CheckEmailDialog> createState() => _CheckEmailDialogState();
}

class _CheckEmailDialogState extends State<CheckEmailDialog>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _textEditingController;

  String? email;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    // getIt<localdb.MyExamDatabase>().getUser().map((event) {
    //   log('${event?.email}');
    //   _textEditingController.text = event?.email ?? '';
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: DecoratedBox(
                decoration: const BoxDecoration(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CustomFormTextField(
                        hintText: 'Enter Email',
                        textEditingController: _textEditingController,
                        titleText: 'Check Email Address',
                        onSaved: (v) => email = v,
                        validator: validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          backgroundColor: AppColors.kPrimaryColor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                        ),
                        child: const Text('Check For Email'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<RegisterExamBloc>().add(
                                  CheckResgisterExamEvent(
                                    email: email?.trim() ?? '',
                                    examId: widget.examId,
                                  ),
                                );
                            Navigator.pop(context);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
