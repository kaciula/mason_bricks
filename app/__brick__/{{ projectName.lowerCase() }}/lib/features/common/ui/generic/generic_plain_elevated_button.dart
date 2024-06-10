import 'package:flutter/material.dart';

import '../../../../app/cubit/app_theme.dart';
import '../semi_custom/plain_constrained_box.dart';
import 'utils/build_context_extension.dart';

class GenericPlainElevatedButton extends StatelessWidget {
  const GenericPlainElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.child,
    required this.minWidth,
    required this.maxWidth,
    required this.minHeight,
    required this.maxHeight,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.disabledBackgroundColor,
    required this.disabledForegroundColor,
    required this.padding,
    required this.elevation,
    required this.shape,
    required this.applyScaleFactor,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final Widget? child;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final EdgeInsets? padding;
  final double? elevation;
  final OutlinedBorder? shape;
  final bool applyScaleFactor;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return PlainConstrainedBox(
      minHeight: minHeight,
      maxHeight: maxHeight,
      minWidth: minWidth,
      maxWidth: maxWidth,
      applyScaleFactor: applyScaleFactor,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          padding: padding != null && scaleFactor != 1
              ? EdgeInsets.only(
                  left: padding!.left * scaleFactor,
                  top: padding!.top * scaleFactor,
                  right: padding!.right * scaleFactor,
                  bottom: padding!.bottom * scaleFactor,
                )
              : padding,
          elevation: elevation,
          shape: shape,
        ),
        child: label != null ? Text(label!) : child,
      ),
    );
  }
}
