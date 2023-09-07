import 'package:flutter/material.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/semi_custom/info_dialog.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/semi_custom/sure_dialog.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  get context => navigatorKey.currentContext;

  // Common
  Future<void> pop() async {
    navigatorKey.currentState!.pop();
  }

  Future<void> popBack(dynamic result) async {
    navigatorKey.currentState!.pop(result);
  }

  void showInfoDialog({required String msg, VoidCallback? onPressed}) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => InfoDialog(msg: msg, onPressed: onPressed),
    );
  }

  void showSureDialog({
    String? title,
    required String msg,
    String? details,
    String? yesBtnLabel,
    String? noBtnLabel,
    required VoidCallback onYesPressed,
    VoidCallback? onNoPressed,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => SureDialog(
        title: title,
        msg: msg,
        details: details,
        yesBtnLabel: yesBtnLabel,
        noBtnLabel: noBtnLabel,
        onYesPressed: onYesPressed,
        onNoPressed: onNoPressed,
      ),
    );
  }

  // ---
}
