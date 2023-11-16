import 'package:flutter/material.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_navigator.dart';
import 'package:{{ projectName.snakeCase() }}/start/service_locator.dart';

import 'app_strings.al.dart';
import 'app_styles.dart';

class AppMessenger {
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static const Duration _snackBarDisplayDuration = Duration(milliseconds: 4000);

  void showInfoSnackBar(String msg) {
    final ScaffoldMessengerState messengerState = messengerKey.currentState!;
    messengerState.showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: _snackBarDisplayDuration,
      ),
    );
  }

  void showErrorSnackBar(String errorMsg, {String? errorDetails}) {
    final ScaffoldMessengerState messengerState = messengerKey.currentState!;

    messengerState.showSnackBar(
      SnackBar(
        content: Text(errorMsg),
        duration: errorDetails != null
            ? const Duration(milliseconds: 10000)
            : _snackBarDisplayDuration,
        backgroundColor: AppColors.red,
        action: errorDetails != null
            ? SnackBarAction(
                label: Strings.details.get(),
                textColor: AppColors.black,
                onPressed: () => _showErrorDetails(errorMsg, errorDetails),
              )
            : null,
      ),
    );
  }

  void _showErrorDetails(String errorMsg, String errorDetails) {
    AppNavigator appNavigator = getIt<AppNavigator>();
    showModalBottomSheet(
      context: appNavigator.context,
      builder: (BuildContext context) {
        return Container(
          color: AppColors.red,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    errorMsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(errorDetails, style: TextStyle(color: AppColors.white)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
