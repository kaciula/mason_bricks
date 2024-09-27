import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';
import '../constants.dart';
import '../generic/generic_plain_elevated_button.dart';

class PlainElevatedButton extends StatelessWidget {
  const PlainElevatedButton({
    super.key,
    required this.onPressed,
    this.label,
    this.minWidth = 0,
    this.maxWidth = double.infinity,
    this.minHeight = 0,
    this.maxHeight = double.infinity,
    this.backgroundColor = _backgroundColor,
    this.foregroundColor = _foregroundColor,
    this.disabledBackgroundColor = _disabledBackgroundColor,
    this.disabledForegroundColor = _disabledForegroundColor,
    this.padding,
    this.elevation = 0,
    this.shape,
    this.applyScaleFactor = applyScaleFactorGlobally,
    this.child,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final Widget? child;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;
  final EdgeInsets? padding;
  final double? elevation;
  final OutlinedBorder? shape;
  final bool applyScaleFactor;

  static ButtonStyle primaryStyle(double scaleFactor) =>
      ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        foregroundColor: _foregroundColor,
        disabledBackgroundColor: _disabledBackgroundColor,
        disabledForegroundColor: _disabledForegroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 21 * scaleFactor,
          vertical: 14 * scaleFactor,
        ),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.roboto,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GenericPlainElevatedButton(
      onPressed: onPressed,
      label: label,
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      padding: padding,
      elevation: elevation,
      shape: shape,
      applyScaleFactor: applyScaleFactor,
      child: child,
    );
  }
}

const Color _backgroundColor = AppColors.mainColor;
const Color _foregroundColor = AppColors.white;
const Color _disabledBackgroundColor = AppColors.green;
const Color _disabledForegroundColor = AppColors.pink;
