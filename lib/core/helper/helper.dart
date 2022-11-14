import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class Helper {
  static bool isExamRunning({
    required String? datetime,
    required String? duration,
  }) {
    try {
      final datenow = DateTime.now();
      final dateGiven = DateTime.parse(datetime!);
      final minutes = int.parse(duration!);

      return datenow.isAfter(dateGiven) &&
          datenow.isBefore(
            dateGiven.add(
              Duration(
                minutes: minutes,
              ),
            ),
          );
    } catch (_) {
      return false;
    }
  }

  static Future<String?> getNepaliDate(BuildContext context) async {
    final date = await picker.showMaterialDatePicker(
      context: context,
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(2000),
      lastDate: NepaliDateTime(2090),
    );
    if (date != null) {
      return (date.toString().split(' '))[0];
    }
    return null;
  }

  static Future<File?> getImage() async {
    final _imagePicker = ImagePicker();
    final imageXFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (imageXFile != null) {
      return File(imageXFile.path);
    }
    return null;
  }
}
