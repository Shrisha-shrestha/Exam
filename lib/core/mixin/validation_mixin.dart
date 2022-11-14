import 'package:creatu_exam/res/app_string.dart';

mixin ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null) {
      return 'Field Cannot Be Empty';
    } else if (value.isEmpty) {
      return 'Field Cannot Be Empty';
    } else if (!RegExp(AppString.emailValidation).hasMatch(value)) {
      return 'Entered Email is Invalid';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null) {
      return 'Field Cannot Be Empty';
    } else if (value.isEmpty) {
      return 'Field Cannot Be Empty';
    } else if (value.length < 6) {
      return 'Password must be at Least 6 characters long';
    }
    return null;
  }

  String? validateCode(String? value) {
    if (value == null) {
      return 'Field Cannot Be Empty';
    } else if (value.isEmpty) {
      return 'Field Cannot Be Empty';
    } else if (value.length < 4) {
      return 'Code must be at Least 4 characters long';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null) {
      return 'Field Cannot Be Empty';
    } else if (value.isEmpty) {
      return 'Field Cannot Be Empty';
    } else if (value.length < 3) {
      return 'Name must be at Least 3 characters long';
    }
    return null;
  }

  String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field Cannot Be Empty';
    }
    return null;
  }
}
