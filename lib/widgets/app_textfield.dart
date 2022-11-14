import 'package:flutter/material.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';

class creatu_examTextField extends StatelessWidget {
  const creatu_examTextField({
    super.key,
    this.textInputType,
    this.inputDecoration,
    this.color,
    this.initialValue,
    this.filled,
    required this.hintText,
    required this.titleText,
    this.textEditingController,
    this.validator,
    this.onChange,
    this.obscureText = false,
    this.suffixIcon,
    this.onSaved,
    this.errorText,
    this.textInputAction,
    this.readOnly = false,
  });
  final TextInputType? textInputType;
  final InputDecoration? inputDecoration;
  final Color? color;

  final String? initialValue;

  final bool? filled;
  final String hintText;
  final bool readOnly;
  final String titleText;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  final TextEditingController? textEditingController;

  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onChange;
  final FormFieldSetter<String>? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              titleText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: AppStyles.kFontOpenSans,
                color: AppColors.kTextPrimaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          TextFormField(
            readOnly: readOnly,
            obscureText: obscureText,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            controller: textEditingController,
            initialValue: initialValue,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              errorText: errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
            ),
            onSaved: onSaved,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
