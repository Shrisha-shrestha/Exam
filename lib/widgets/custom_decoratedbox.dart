import 'package:creatu_exam/res/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDecoratedBox extends StatelessWidget {
  const CustomDecoratedBox({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
  });

  final Widget child;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? AppColors.kPrimaryColor,
        ),
      ),
      child: child,
    );
  }
}
