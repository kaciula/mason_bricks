import 'package:flutter/material.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/generic/utils/string_extension.dart';

abstract class UncaughtErrorHandler {
  Future<void> handleFlutterError(FlutterErrorDetails details);

  Future<void> handleAppError(dynamic exception, dynamic stack);

  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp});

  Future<void> log(String msg);

  Future<void> setUserId(String? userId);
}

bool shouldKillApp(String sException) {
  return !sException.containsIgnoreCase('Failed to load') &&
      !sException.containsIgnoreCase('Codec failed to produce an image') &&
      !sException.containsIgnoreCase('VideoError') &&
      !sException.containsIgnoreCase('HttpException') &&
      !sException.containsIgnoreCase(
          'Bad state: Stream has already been listened to') &&
      !sException.containsIgnoreCase('Invalid image data') &&
      !sException.containsIgnoreCase('NetworkImage is an empty file');
}

bool shouldReportException(String sException) {
  return !sException.containsIgnoreCase('Failed to load');
}
