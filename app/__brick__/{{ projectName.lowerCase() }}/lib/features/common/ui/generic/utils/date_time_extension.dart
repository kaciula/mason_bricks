import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  DateTime withTime(TimeOfDay time) =>
      DateTime(year, month, day, time.hour, time.minute);

  bool isAfterNow() => isAfter(DateTime.now());

  bool isBeforeNow() => isBefore(DateTime.now());

  bool isSameDay(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

  bool isBeforeDay(DateTime other) {
    final TimeOfDay firstTimeOfDay = TimeOfDay(hour: 0, minute: 0);
    return withTime(firstTimeOfDay).isBefore(other.withTime(firstTimeOfDay));
  }

  bool isAfterDay(DateTime other) {
    final TimeOfDay lastTimeOfDay = TimeOfDay(hour: 23, minute: 59);
    return withTime(lastTimeOfDay).isAfter(other.withTime(lastTimeOfDay));
  }

  DateTime monday() => minusDays(weekday - 1);

  int get lastDayOfMonth => DateTime(year, month + 1, 0).day;

  DateTime get lastDateOfMonth => DateTime(year, month + 1, 0);

  DateTime plusDays(int days) {
    // Do like this to avoid DST issues when using add method
    return DateTime(year, month, day + days, hour, minute, second, millisecond);
  }

  DateTime minusDays(int days) {
    // Do like this to avoid DST issues when using subtract method
    return DateTime(year, month, day - days, hour, minute, second, millisecond);
  }

  DateTime minusMinutes(int minutes) {
    // Do like this to avoid DST issues when using subtract method
    return DateTime(
        year, month, day, hour, minute - minutes, second, millisecond);
  }

  DateTime plusMinutes(int minutes) {
    // Do like this to avoid DST issues when using add method
    return DateTime(
        year, month, day, hour, minute + minutes, second, millisecond);
  }

  DateTime minusSeconds(int seconds) {
    // Do like this to avoid DST issues when using subtract method
    return DateTime(
        year, month, day, hour, minute, second - seconds, millisecond);
  }

  DateTime plusSeconds(int seconds) {
    // Do like this to avoid DST issues when using add method
    return DateTime(
        year, month, day, hour, minute, second + seconds, millisecond);
  }

  int differenceInDays(DateTime other) {
    // Do like this to avoid DST issues
    final DateTime thisDateTime = DateTime(year, month, day);
    final DateTime otherDateTime = DateTime(other.year, other.month, other.day);
    return (thisDateTime.difference(otherDateTime).inHours / 24).round();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int weekNumOfYear() {
    int dayOfYear = int.parse(DateFormat('D').format(this));
    int woy = ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numWeeksOfYear(year - 1);
    } else if (woy > numWeeksOfYear(year)) {
      woy = 1;
    }
    return woy;
  }

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  static int numWeeksOfYear(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat('D').format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }
}
