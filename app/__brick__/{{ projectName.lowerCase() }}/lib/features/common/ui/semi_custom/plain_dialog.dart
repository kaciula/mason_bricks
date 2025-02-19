import 'package:flutter/material.dart';
import '../../../../app/app_strings.al.dart';
import '../../../../app/app_styles.dart';
import '../generic/utils/build_context_extension.dart';

import 'plain_constrained_box.dart';
import 'plain_text_button.dart';

class PlainDialog extends StatelessWidget {
  const PlainDialog({
    super.key,
    this.title,
    this.maxWidth = 300,
    this.minWidth = 0,
    this.maxHeight,
    this.minHeight = 0,
    this.showOkAction = false,
    this.applyBottomContentPadding = true,
    this.actions,
    required this.child,
  });

  final String? title;
  final double maxWidth;
  final double minWidth;
  final double? maxHeight;
  final double minHeight;
  final bool showOkAction;
  final bool applyBottomContentPadding;
  final List<Widget>? actions;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = context.theme.appThemeExtension.scaleFactor;
    return AlertDialog(
      titlePadding: EdgeInsets.only(
        left: 16 * scaleFactor,
        right: 16 * scaleFactor,
        top: 16 * scaleFactor,
      ),
      contentPadding: EdgeInsets.only(
        left: 16 * scaleFactor,
        top: 16 * scaleFactor,
        right: 16 * scaleFactor,
        bottom: applyBottomContentPadding ? 16 * scaleFactor : 0,
      ),
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            )
          : null,
      content: PlainConstrainedBox(
        maxWidth: maxWidth,
        minWidth: minWidth,
        maxHeight: maxHeight ?? 0.8 * MediaQuery.sizeOf(context).height,
        minHeight: minHeight,
        child: child,
      ),
      actions: actions ??
          (showOkAction
              ? [
                  PlainTextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(Strings.genericOk.get()),
                  ),
                ]
              : null),
    );
  }
}
