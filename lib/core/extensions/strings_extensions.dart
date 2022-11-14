import 'package:html/parser.dart';
import 'package:intl/intl.dart';

extension stringFormtter on String? {
  String htmlToShortText() {
    try {
      final document = parse(this);
      final text = parse(document.body?.text).documentElement?.text;

      return (text?.length ?? 0) > 60
          ? text?.substring(0, 60) ?? ''
          : text ?? '';
    } catch (_) {
      return '';
    }
  }

  String htmlToText() {
    try {
      final document = parse(this);
      return parse(document.body?.text).documentElement?.text ?? '';
    } catch (_) {
      return '';
    }
  }

  String firstLetterToUpperCase() {
    if (this == null || this == '') {
      return '';
    }
    return '${this?.substring(0, 1).toUpperCase()}${this?.substring(
      1,
      this?.length,
    )}';
  }

  String? getDateFromString() {
    if (this != null) {
      try {
        final stringDate = this?.split('T')[0];
        return DateFormat.yMd().format(DateTime.parse(stringDate!));
      } catch (_) {}
    }
    return null;
  }

  String? getTimeFromString() {
    if (this != null) {
      try {
        return this?.split('T')[1];
        // return DateFormat.Hms().format(DateTime.parse(stringDate!));
      } catch (_) {}
    }
    return null;
  }
}
