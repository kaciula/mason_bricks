import 'dart:isolate';

{{#useFirebase}}import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';
import 'uncaught_error_handler_release.dart';{{/useFirebase}}
import 'uncaught_error_handler_debug.dart';
import 'uncaught_error_handler.dart';

class CrashService {
  late UncaughtErrorHandler _uncaughtErrorHandler;

  Future<void> init() async {
    {{#useFirebase}}if (kReleaseMode && !Platform.isWindows) {
      _uncaughtErrorHandler = UncaughtErrorHandlerRelease();
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError = (FlutterErrorDetails details) async {
        await _uncaughtErrorHandler.handleFlutterError(details);
      };
    } else {
      _uncaughtErrorHandler = UncaughtErrorHandlerDebug();
      if (!Platform.isWindows) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(false);
      }
    }{{/useFirebase}}
    {{^useFirebase}}_uncaughtErrorHandler = UncaughtErrorHandlerDebug();{{/useFirebase}}

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      _uncaughtErrorHandler.handleAppError(error, stack);
      return true;
    };

    Isolate.current.addErrorListener(RawReceivePort(
      (pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        _uncaughtErrorHandler.handleAppError(
            errorAndStacktrace.first, errorAndStacktrace.last);
      },
    ).sendPort);
  }

  void initInIsolate() {
    _uncaughtErrorHandler = UncaughtErrorHandlerDebug();
  }

  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp}) {
    return _uncaughtErrorHandler
        .reportUnexpectedError(exception, trace, context, killApp: killApp);
  }

  Future<void> log(String msg) async {
    _uncaughtErrorHandler.log(msg);
  }

  Future<void> setUserId(String? userId) {
    return _uncaughtErrorHandler.setUserId(userId);
  }

  Future<void> setCustomKey(String key, dynamic value) {
    return _uncaughtErrorHandler.setCustomKey(key, value);
  }
}

