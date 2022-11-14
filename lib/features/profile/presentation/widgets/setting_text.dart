import 'package:flutter/material.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';

class SettingText extends StatelessWidget {
  const SettingText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.kTextPrimaryColor,
        fontSize: 13,
        fontWeight: FontWeight.bold,
        fontFamily: AppStyles.kMonoSerrat,
      ),
    );
  }
}
