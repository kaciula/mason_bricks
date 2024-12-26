import 'package:flutter/services.dart';
import 'package:{{ projectName.snakeCase() }}/services/generic/crash/crash_service.dart';
import 'package:{{ projectName.snakeCase() }}/services/generic/log_service.dart';

import 'service_locator.dart';

Future<void> init() async {
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
}
