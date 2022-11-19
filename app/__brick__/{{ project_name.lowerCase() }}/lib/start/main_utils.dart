import 'package:{{ project_name.snakeCase() }}/infrastructure/misc/crash/crash_reporter.dart';
import 'package:{{ project_name.snakeCase() }}/infrastructure/services/log_service.dart';
import 'package:flutter/services.dart';

import 'service_locator.dart';

Future<void> init() async {
  final CrashReporter crashReporter = getIt<CrashReporter>();
  final LogService logService = getIt<LogService>();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  await logService.init();
  await crashReporter.init();
}
