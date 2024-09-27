import 'package:flutter/material.dart';

class GenericPlainTextButton extends StatelessWidget {
  const GenericPlainTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.labelStyle,
    required this.foregroundColor,
    required this.padding,
    required this.applyScaleFactor,
    required this.child,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final TextStyle? labelStyle;
  final Color foregroundColor;
  final EdgeInsets? padding;
  final bool applyScaleFactor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.padded,
        padding: padding != null && scaleFactor != 1
            ? EdgeInsets.only(
                left: padding!.left * scaleFactor,
                top: padding!.top * scaleFactor,
                right: padding!.right * scaleFactor,
                bottom: padding!.bottom * scaleFactor,
              )
            : padding,
        foregroundColor: foregroundColor,
      ),
      child: label != null ? Text(label!, style: labelStyle) : child!,
    );
  }
}
