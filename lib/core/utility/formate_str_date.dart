import 'package:intl/intl.dart';

String formatDateString(String dateString) {
  DateTime date = DateTime.parse(dateString);
  DateFormat dateFormat = DateFormat('dd MMM yyyy h:mm a');
  return dateFormat.format(date);
}
