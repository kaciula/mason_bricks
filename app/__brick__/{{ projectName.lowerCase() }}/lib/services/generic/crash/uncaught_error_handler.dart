import 'package:{{ projectName.snakeCase() }}/features/common/ui/generic/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';

abstract class UncaughtErrorHandler {
  Future<void> handleFlutterError(FlutterErrorDetails details);

  Future<void> handleAppError(dynamic exception, dynamic stack);

  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp});

  Future<void> log(String msg);

  Future<void> setUserId(String? userId);

  Future<void> setCustomKey(String key, dynamic value);
}

bool shouldKillApp(String sException) {
  return _doNotKillExceptions.none((e) => sException.containsIgnoreCase(e));
}

final KtList<String> _doNotKillExceptions = [
  'Failed to load',
  'Codec failed to produce an image',
  'VideoError',
  'HttpException',
  'Bad state: Stream has already been listened to',
  'Invalid image data',
  'NetworkImage is an empty file',
  'PlatformException(0, Source error',
  'PlatformException(abort, Connection aborted, null, null)',
  'PlatformException(-1102, You do not have permission to access the requested resource',
  'PlatformException(-1001, The request timed out',
  'HttpException: Operation timed out',
  'PlatformException(-1009, The Internet connection appears to be offline',
  'PlatformException(-1100, The requested URL was not found on this server',
  'PlatformException(-11819, Cannot Complete Action',
  'PlatformException(-11800, The operation could not be completed',
  'PlatformException(-1202, The certificate for this server is invalid',
  'PlatformException(-50, Session lookup failed',
  'PlatformException(560557684, Session activation failed',
  'SocketException: Connection reset by peer',
  'SocketException: Failed host lookup',
].toImmutableList();

bool shouldReportException(String sException) {
  return _doNotReportExceptions.none((e) => sException.containsIgnoreCase(e));
}

final KtList<String> _doNotReportExceptions = [
  'Failed to load',
  'PlatformException(0, Source error',
  'PlatformException(abort, Connection aborted, null, null)',
  'PlatformException(-1001, The request timed out',
  'PlatformException(-11819, Cannot Complete Action',
  'PlatformException(-11800, The operation could not be completed',
  'PlatformException(-50, Session lookup failed',
  'PlatformException(560557684, Session activation failed',
  'HttpException: Operation timed out',
].toImmutableList();
