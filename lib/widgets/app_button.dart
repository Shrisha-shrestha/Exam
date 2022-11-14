import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.loading,
  });

  final String title;
  final VoidCallback? onPressed;

  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.sp,
      child: ElevatedButton(
        onPressed: loading == true ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: AppStyles.kFontOpenSans,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (loading == true) const CustomProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
