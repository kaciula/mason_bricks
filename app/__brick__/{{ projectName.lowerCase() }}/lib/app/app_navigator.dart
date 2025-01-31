import 'package:flutter/material.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/semi_custom/info_dialog.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/semi_custom/plain_constrained_box.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/semi_custom/sure_dialog.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();

  get context => globalNavigatorKey.currentContext;

  // Common
  Future<void> pop() async {
    globalNavigatorKey.currentState!.pop();
  }

  Future<void> popBack(dynamic result) async {
    globalNavigatorKey.currentState!.pop(result);
  }

  void showInfoDialog({required String msg, VoidCallback? onPressed}) {
    showDialog(
      context: globalNavigatorKey.currentContext!,
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
      context: globalNavigatorKey.currentContext!,
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

  void showPlainDialog(Widget dialog,
      {bool barrierDismissible = true, bool usePostFrameCallback = false}) {
    if (!usePostFrameCallback) {
      showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => dialog,
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showPlainDialog(
          dialog,
          barrierDismissible: barrierDismissible,
          usePostFrameCallback: false,
        );
      });
    }
  }

  void showSheet(
    Widget sheet, {
    bool isScrollControlled = false,
    bool usePostFrameCallback = false,
    double borderRadius = 20,
    double heightFactor = 0.9,
  }) {
    if (!usePostFrameCallback) {
      showModalBottomSheet(
        context: context,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
        ),
        isScrollControlled: isScrollControlled,
        builder: (BuildContext context) => isScrollControlled
            ? PlainConstrainedBox(
                maxHeight: heightFactor * MediaQuery.sizeOf(context).height,
                applyScaleFactor: false,
                child: sheet,
              )
            : sheet,
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showSheet(
          sheet,
          isScrollControlled: isScrollControlled,
          usePostFrameCallback: false,
        );
      });
    }
  }
  // ---
}
