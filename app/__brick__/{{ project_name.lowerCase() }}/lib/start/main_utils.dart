import 'package:flutter/services.dart';
import 'package:{{ project_name.snakeCase() }}/services/generic/crash/crash_service.dart';
import 'package:{{ project_name.snakeCase() }}/services/generic/log_service.dart';

import 'service_locator.dart';

Future<void> init() async {
  final CrashService crashService = getIt<CrashService>();
  final LogService logService = getIt<LogService>();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  await logService.init();
  await crashService.init();
}
