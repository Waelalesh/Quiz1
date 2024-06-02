import 'package:intl/intl.dart';

mixin MyDateTime {
  static String convertDateToFormattedString(String dateTimeString) {
  // Parse the string into a DateTime object considering UTC
  DateTime utcDateTime = DateTime.parse(dateTimeString).toUtc();

  // Extract year, month (abbreviated format), and day
  int year = utcDateTime.year;
  String month = DateFormat('MMM').format(utcDateTime);  
  int day = utcDateTime.day;

  
  return '$day-$month, $year';
}

 

}
