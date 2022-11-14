import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String message,
  Color? snackBarColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: snackBarColor ?? Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: 0.85.sh,
        left: 0.2.sw,
      ),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
