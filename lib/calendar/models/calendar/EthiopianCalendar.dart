import '../../utils/Bahirehasab.dart';
import '../../utils/util.dart';
import 'GregorianCalendar.dart';

class EthiopianCalendar {
  int? year;
  int? month;
  int? day;
  String? holiday_name;
  bool isHoliday = false;
  String? month_name;
  String? day_name;

  EthiopianCalendar({this.year, this.month, this.day}) {
    month_name = months[month! - 1];
    holiday_name =
        getHoliday(months[month! - 1], day, year);
    isHoliday = holiday_name != "" ? true : false;
  }

  EthiopianCalendar.now() {
    var fixed = fixedFromUnix(DateTime.now().millisecondsSinceEpoch);
    year = ((4 * (fixed - ethiopicEpoch) + 1463) ~/ 1461);
    month = (((fixed - fixedFromEthiopic(year!, 1, 1)) ~/ 30) + 1);
    day = fixed + 1 - fixedFromEthiopic(year!, month!, 1);
    month_name = months[(month! - 1) % 13];
    holiday_name =
        getHoliday(months[month! - 1], day, year);
    isHoliday = holiday_name != "" ? true : false;

    var gc = toGC();
    day_name = dayss[getDayName(gc.month, gc.day, gc.year)];
  }

  GregorianCalendar toGC() {
    return GregorianCalendar(
        year: DateTime.fromMillisecondsSinceEpoch(
                dateToEpoch(year!, month!, day!))
            .year,
        month: DateTime.fromMillisecondsSinceEpoch(
                dateToEpoch(year!, month!, day!))
            .month,
        day: DateTime.fromMillisecondsSinceEpoch(
                dateToEpoch(year!, month!, day!))
            .day);
  }

  EthiopianCalendar nextMonth() {
    var isLastMonth = month == 13 || (month == 12 && day! > 6);
    return EthiopianCalendar(
        year: isLastMonth ? year! + 1 : year,
        month: isLastMonth ? 1 : month! + 1,
        day: day);
  }

  EthiopianCalendar previousMonth() {
    var isFirstMonth = month == 1;
    return EthiopianCalendar(
        year: isFirstMonth ? year! - 1 : year,
        month: isFirstMonth ? (day! > 6 ? 12 : 13) : month! - 1,
        day: day);
  }

  EthiopianCalendar nextYear() {
    return EthiopianCalendar(
        year: year! + 1, month: month, day: day);
  }

  // thisYear() {
  //   // return EthiopianCalendar(
  //   //     year: this.year!, month: this.month, day: this.day);
  //   String current_day = '$this.year : $this.month : $this.day';
  //   return current_day;
  // }

  EthiopianCalendar currentDay() {
    return EthiopianCalendar(
        year: year!, month: month, day: day);
  }

  EthiopianCalendar previousYear() {
    return EthiopianCalendar(
        year: year! - 1, month: month, day: day);
  }

  int daysInMonth() {
    if (month == 13) {
      // In a leap year, the 13th month has 6 days
      return isLeapYear(year!) ? 6 : 5;
    } else {
      // All other months have 30 days
      return 30;
    }
  }

  bool isLeapYear(int year) {
    // A year is a leap year if it is divisible by 4 and not divisible by 100,
    // or if it is divisible by 400
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  // int firstDayOfWeek() {
  //   var epochDay = fixedFromEthiopic(this.year!, this.month!, 1) - 1;
  //   // The Ethiopic calendar has a 7-day week
  //   return (epochDay + 3) % 7;
  // }
  int firstDayOfWeek() {
    // Calculate the epoch day of the first day of the current month
    int epochDay = fixedFromEthiopic(year!, month!, 1) - 1;

    // Calculate the number of leap days in the current year up to the current month
    int leapDays = 0;
    for (int i = 1; i < month!; i++) {
      if (i == 13 && isLeapYear(year!)) {
        leapDays += 1;
      }
      leapDays += 1;
    }

    // Calculate the first day of the week by adding the epoch day and leap days
    // to an offset of 3 (corresponding to September 1st, 8 CE, in the Julian calendar)
    int firstDayOfWeek = (epochDay + leapDays + 3) % 7;

    return firstDayOfWeek;
  }
}
