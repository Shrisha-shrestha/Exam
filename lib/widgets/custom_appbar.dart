import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: Colors.white,

      //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
      // ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.kPrimaryColor,
        ),
      ),
      elevation: 5,
      titleTextStyle: const TextStyle(
        color: AppColors.kTextPrimaryColor,
        fontFamily: AppStyles.kFontOpenSans,
        fontWeight: FontWeight.w800,
        fontSize: 14,
      ),
      iconTheme: const IconThemeData(color: AppColors.kTextPrimaryColor),
      backgroundColor: AppColors.kWhiteColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
