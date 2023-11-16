import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:{{ projectName.snakeCase() }}/app/app.dart';
import 'package:{{ projectName.snakeCase() }}/services/generic/crash/crash_service.dart';
import 'package:flutter/material.dart';

import 'main_utils.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await registerInstances();
  await init();

  runApp(MainApp());
}
