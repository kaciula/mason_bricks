import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
  DateTime withTime(TimeOfDay time) =>
      DateTime(year, month, day, time.hour, time.minute);

  bool isAfterNow() => isAfter(DateTime.now());

  bool isBeforeNow() => isBefore(DateTime.now());
}
