import 'package:flutter/material.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    this.textInputType,
    this.inputDecoration,
    this.color,
    this.filled,
    required this.hintText,
    required this.titleText,
    this.textEditingController,
    this.validator,
    this.onChange,
    this.obscureText = false,
    this.suffixIcon,
    this.onSaved,
    this.maxLines = 1,
    this.initialValue,
    this.readOnly,
    this.textInputAction,
    this.onTap,
  });
  final TextInputType? textInputType;
  final InputDecoration? inputDecoration;
  final Color? color;

  final int maxLines;

  final String? initialValue;

  final bool? filled;
  final String hintText;
  final String titleText;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;

  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onChange;
  final FormFieldSetter<String>? onSaved;
  final bool obscureText;

  final bool? readOnly;

  final TextInputAction? textInputAction;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                titleText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppStyles.kMonoSerrat,
                  color: AppColors.kTextPrimaryColor,
                ),
              ),
            ),
          const SizedBox(
            height: 3,
          ),
          Theme(
            data: ThemeData(),
            child: TextFormField(
              initialValue: initialValue,
              obscureText: obscureText,
              keyboardType: textInputType,
              controller: textEditingController,
              textInputAction: textInputAction,
              onTap: onTap,
              readOnly: readOnly ?? false,
              maxLines: maxLines,
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: HSLColor.fromColor(AppColors.kPrimaryColor)
                        .withLightness(0.5)
                        .withSaturation(0.7)
                        .withHue(100)
                        .toColor(),
                  ),
                ),
                fillColor: AppColors.kPrimaryColor.withOpacity(0.1),
                filled: true,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColors.kPrimaryColor,
                ),
              ),
              onSaved: onSaved,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
