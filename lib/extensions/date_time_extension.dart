part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String get shortDayName {
    switch (this.weekday) {
      case 1:
        return "MON";
      case 2:
        return "TUE";
      case 3:
        return "WED";
      case 4:
        return "THU";
      case 5:
        return "FRI";
      case 6:
        return "SAT";
      default:
        return "SUN";
    }
  }
}
