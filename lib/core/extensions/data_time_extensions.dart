import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime? {
  String getDateOnly() {
    if (this == null) {
      return '';
    }
    return DateFormat.yMd().format(this!);
  }
}
