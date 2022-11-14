import 'package:flutter/material.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';

class TitleValueWidget extends StatelessWidget {
  const TitleValueWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title :  ',
            style: const TextStyle(
              fontSize: 14,
              fontFamily: AppStyles.kFontOpenSans,
              fontWeight: FontWeight.w600,
              color: AppColors.kTextPrimaryColor,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: AppStyles.kFontOpenSans,
              fontWeight: FontWeight.w500,
              color: AppColors.kTextPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
