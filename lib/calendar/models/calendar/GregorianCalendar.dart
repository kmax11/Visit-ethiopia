import '../../utils/util.dart';
import 'EthiopianCalendar.dart';

const List<String> _months = [
  "January",
  "Feburary",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

const List<String> _days = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednsday",
  "Thursday",
  "Friday",
  "Saturday"
];

class GregorianCalendar {
  int? year;
  int? month;
  int? day;
  String? month_name;
  String? day_name;

  GregorianCalendar({this.year, this.month, this.day}) {
    month_name = _months[(month! - 1) % 12];
    day_name = _days[getDayName(month!, day!, year!)];
  }

  GregorianCalendar.now() {
    year = DateTime.now().year;
    month = DateTime.now().month;
    day = DateTime.now().day;
    month_name = _months[(month! - 1) % 12];
    day_name = _days[getDayName(month!, day!, year!)];
  }

  EthiopianCalendar toEc() {
    var datetime = DateTime(year!, month!, day!);
    var fixed = fixedFromUnix(datetime.millisecondsSinceEpoch);
    var eyear = ((4 * (fixed - ethiopicEpoch) + 1463) ~/ 1461);
    var emonth = (((fixed - fixedFromEthiopic(eyear, 1, 1)) ~/ 30) + 1);
    var eday = fixed + 1 - fixedFromEthiopic(eyear, emonth, 1);
    return EthiopianCalendar(year: eyear, month: emonth, day: eday);
  }

  GregorianCalendar nextMonth() {
    var isLastMonth = month == 12;
    return GregorianCalendar(
        year: isLastMonth ? year! + 1 : year,
        month: isLastMonth ? 1 : month! + 1,
        day: day);
  }

  GregorianCalendar previousMonth() {
    var isFirstMonth = month == 1;
    return GregorianCalendar(
        year: isFirstMonth ? year! - 1 : year,
        month: isFirstMonth ? 12 : month! - 1,
        day: day);
  }

  GregorianCalendar nextYear() {
    return GregorianCalendar(
        year: year! + 1, month: month, day: day);
  }

  GregorianCalendar previousYear() {
    return GregorianCalendar(
        year: year! - 1, month: month, day: day);
  }
}
