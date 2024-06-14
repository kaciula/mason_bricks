import 'package:flutter/material.dart';
import 'package:protern_sync/app/cubit/app_theme.dart';
import 'package:protern_sync/features/common/ui/generic/utils/build_context_extension.dart';

class PlainTextButton extends StatelessWidget {
  const PlainTextButton({
    super.key,
    required this.onPressed,
    this.label,
    this.child,
    this.padding,
    this.applyScaleFactor = true,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final Widget? child;
  final EdgeInsets? padding;
  final bool applyScaleFactor;

  static ButtonStyle primaryStyle(double scaleFactor) => TextButton.styleFrom(
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.padded,
        padding: EdgeInsets.symmetric(
          horizontal: 16 * scaleFactor,
          vertical: 12 * scaleFactor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding != null && scaleFactor != 1
            ? EdgeInsets.only(
                left: padding!.left * scaleFactor,
                top: padding!.top * scaleFactor,
                right: padding!.right * scaleFactor,
                bottom: padding!.bottom * scaleFactor,
              )
            : padding,
      ),
      child: label != null ? Text(label!) : child!,
    );
  }
}
