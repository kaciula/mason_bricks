{{#useFirebase}}import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'uncaught_error_handler_release.dart';{{/useFirebase}}
import 'uncaught_error_handler_debug.dart';
import 'uncaught_error_handler.dart';

class CrashService {
  late UncaughtErrorHandler _uncaughtErrorHandler;

  Future<void> init() async {
    {{#useFirebase}}if (kReleaseMode) {
      _uncaughtErrorHandler = UncaughtErrorHandlerRelease();
      FlutterError.onError = (FlutterErrorDetails details) async {
        await _uncaughtErrorHandler.handleFlutterError(details);
      };
    } else {
      _uncaughtErrorHandler = UncaughtErrorHandlerDebug();
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    }{{/useFirebase}}
    {{^useFirebase}}_uncaughtErrorHandler = UncaughtErrorHandlerDebug();{{/useFirebase}}
  }

  Future<void> handleZonedError(dynamic exception, dynamic stack) async {
    return _uncaughtErrorHandler.handleZonedError(exception, stack);
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
}
