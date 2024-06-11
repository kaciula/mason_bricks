import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/generic/utils/cubit_extension.dart';

import 'app_state.dart';
import 'app_theme.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(_initial());

  static AppState _initial() {
    return AppState.initial(
      AppTheme.initial(ThemeMode.light),
    );
  }

  void scaleFactorUpdated(double scaleFactor) {
    final AppTheme updatedAppTheme =
        state.appTheme.copyWith(scaleFactor: scaleFactor);
    safeEmit(state.copyWith(appTheme: updatedAppTheme));
  }

  void appStarted() {}

  void appResumed() {}

  void appPaused() {}
}

// ignore: unused_element
final Logger _logger = Logger('AppCubit');
