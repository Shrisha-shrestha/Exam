import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({super.key, required this.message, this.statusCode});
  final String message;
  final int? statusCode;

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.1.sw,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.kWhiteColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  ' Error Occured ',
                  style: TextStyle(
                    color: AppColors.kTextPrimaryColor,
                    fontFamily: AppStyles.kFontOpenSans,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    widget.message,
                    style: const TextStyle(
                      color: AppColors.kTextPrimaryColor,
                      fontFamily: AppStyles.kMonoSerrat,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.kGreyColor.withOpacity(0.4),
                    ),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Try Again',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppStyles.kFontOpenSans,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.kGreyColor.withOpacity(0.4),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Dismiss',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppStyles.kFontOpenSans,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kTextPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 1,
                //   width: double.infinity,
                //   child: DecoratedBox(
                //     decoration: BoxDecoration(
                //       color: AppColors.kGreyColor,
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   width: double.infinity,
                //   child: Center(
                //     child: Text(
                //       'Dismiss',
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
