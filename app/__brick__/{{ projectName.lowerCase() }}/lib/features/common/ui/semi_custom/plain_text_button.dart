import 'package:flutter/material.dart';
import 'package:protern_sync/app/cubit/app_theme.dart';
import 'package:protern_sync/features/common/ui/generic/utils/build_context_extension.dart';

import '../../../../app/app_styles.dart';
import '../constants.dart';

class PlainTextButton extends StatelessWidget {
  const PlainTextButton({
    super.key,
    required this.onPressed,
    this.label,
    this.labelStyle,
    this.foregroundColor = AppColors.pink,
    this.padding,
    this.applyScaleFactor = applyScaleFactorGlobally,
    this.child,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final TextStyle? labelStyle;
  final Color foregroundColor;
  final EdgeInsets? padding;
  final Widget? child;

  static ButtonStyle primaryStyle(double scaleFactor) => TextButton.styleFrom(
        foregroundColor: AppColors.pink,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.padded,
        padding: EdgeInsets.only(
          left: 8 * scaleFactor,
          right: 8 * scaleFactor,
          top: 8 * scaleFactor,
          bottom: 8 * scaleFactor,
        ),
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.roboto,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GenericPlainTextButton(
      onPressed: onPressed,
      label: label,
      labelStyle: labelStyle,
      foregroundColor: foregroundColor,
      padding: padding,
      applyScaleFactor: applyScaleFactor,
      child: child,
    );
  }
}
