import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:flutter/material.dart';

class CourseTitleWidget extends StatelessWidget {
  const CourseTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.kTextPrimaryColor,
        fontFamily: AppStyles.kFontOpenSans,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}
