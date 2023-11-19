import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

class TimeTableData {
  final String subject;
  final String room;
  final String day;
  final TimeOfDay timeBegin;
  final TimeOfDay timeEnd;
  final String id;

  TimeTableData({
    required this.subject,
    required this.room,
    required this.day,
    required this.timeBegin,
    required this.timeEnd,
    required this.id,
  });

  static TimeOfDay stringToTimeOfDay(String timeString) {
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  static String timeOfDayToString(TimeOfDay timeOfDay) {
    return '${timeOfDay.hour}:${timeOfDay.minute}';
  }

  static int dayToNumber(String day) {
    switch (day) {
      case Weekday.tuesday:
        return 3;
      case Weekday.wednesday:
        return 4;
      case Weekday.thursday:
        return 5;
      case Weekday.friday:
        return 6;
      case Weekday.saturday:
        return 7;
      case Weekday.sunday:
        return 8;
      default:
        return 2;
    }
  }
}

List<TimeTableData> timeTableList = [];
void sortTimetbaleList() {
  timeTableList.sort((a, b) {
    // Compare days using dayToNumber
    int dayComparison = TimeTableData.dayToNumber(a.day)
        .compareTo(TimeTableData.dayToNumber(b.day));

    if (dayComparison != 0) {
      // If days are different, return the comparison result
      return dayComparison;
    } else {
      // If days are the same, compare timeBegin
      if (a.timeBegin.hour != b.timeBegin.hour) {
        return a.timeBegin.hour.compareTo(b.timeBegin.hour);
      } else {
        return a.timeBegin.minute.compareTo(b.timeBegin.minute);
      }
    }
  });
}
