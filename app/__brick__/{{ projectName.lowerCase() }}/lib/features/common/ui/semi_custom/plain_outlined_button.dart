import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';
import '../generic/generic_plain_outlined_button.dart';

class PlainOutlinedButton extends StatelessWidget {
  const PlainOutlinedButton({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.minWidth = double.infinity,
    this.maxWidth = double.infinity,
    this.minHeight = 0,
    this.maxHeight = double.infinity,
    this.backgroundColor = AppColors.white,
    this.foregroundColor = AppColors.pink,
    this.side,
    this.padding,
    this.shape,
    this.applyScaleFactor = true,
    this.child,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final Widget? icon;
  final Widget? child;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final Color backgroundColor;
  final Color foregroundColor;
  final BorderSide? side;
  final EdgeInsets? padding;
  final OutlinedBorder? shape;
  final bool applyScaleFactor;

  static ButtonStyle primaryStyle(double scaleFactor) =>
      OutlinedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 21 * scaleFactor,
          vertical: 18 * scaleFactor,
        ),
        textStyle: TextStyle(
          fontSize: 15,
          fontFamily: AppFonts.roboto,
        ),
        side: BorderSide(color: AppColors.green, width: 1),
      );

  @override
  Widget build(BuildContext context) {
    return GenericPlainOutlinedButton(
      onPressed: onPressed,
      label: label,
      icon: icon,
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      side: side,
      padding: padding,
      shape: shape,
      applyScaleFactor: applyScaleFactor,
      child: child,
    );
  }
}
