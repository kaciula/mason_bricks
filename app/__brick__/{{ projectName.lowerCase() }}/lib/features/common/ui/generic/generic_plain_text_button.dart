import 'package:flutter/material.dart';

class GenericPlainTextButton extends StatelessWidget {
  const GenericPlainTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.labelStyle,
    required this.foregroundColor,
    required this.padding,
    required this.child,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final TextStyle? labelStyle;
  final Color foregroundColor;
  final EdgeInsets? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.padded,
        padding: padding,
        foregroundColor: foregroundColor,
      ),
      child: label != null ? Text(label!, style: labelStyle) : child!,
    );
  }
}
