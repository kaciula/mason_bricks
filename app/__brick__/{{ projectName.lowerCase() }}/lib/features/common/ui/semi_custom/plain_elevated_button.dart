import 'package:flutter/material.dart';
import 'package:kozmoz/app/app_styles.dart';
import 'package:kozmoz/features/common/ui/generic/generic_plain_elevated_button.dart';

class PlainElevatedButton extends StatelessWidget {
  const PlainElevatedButton({
    super.key,
    required this.onPressed,
    this.label,
    this.minWidth = double.infinity,
    this.maxWidth = double.infinity,
    this.minHeight = 0,
    this.maxHeight = double.infinity,
    this.backgroundColor = AppColors.purple,
    this.foregroundColor = AppColors.white,
    this.padding,
    this.elevation = 0,
    this.shape,
    this.applyScaleFactor = true,
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
  final EdgeInsets? padding;
  final double? elevation;
  final OutlinedBorder? shape;
  final bool applyScaleFactor;

  static ButtonStyle primaryStyle() => ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
        textStyle: TextStyle(
          fontSize: 15,
          fontFamily: AppFonts.montserrat,
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
      padding: padding,
      elevation: elevation,
      shape: shape,
      applyScaleFactor: applyScaleFactor,
      child: child,
    );
  }
}
