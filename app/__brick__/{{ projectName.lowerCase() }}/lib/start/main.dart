import 'dart:async';

import 'dart:async';

import 'package:{{ projectName.snakeCase() }}/app/app.dart';
import 'package:{{ projectName.snakeCase() }}/services/generic/crash/crash_service.dart';
import 'package:flutter/material.dart';

import 'main_utils.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await registerInstances();
  await init();

  const Widget app = MainApp();
  if (kReleaseMode) {
    runAppInReleaseMode(app);
  } else {
    runApp(app);
  }
}

void runAppInReleaseMode(Widget app) {
  runZonedGuarded<Future<void>>(() async {
    runApp(app);
  }, (Object error, StackTrace stack) async {
    await getIt<CrashService>().handleZonedError(error, stack);
  });
}
