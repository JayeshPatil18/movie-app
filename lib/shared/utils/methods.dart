import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  return DateFormat('MMMM d, yyyy').format(parsedDate);
}