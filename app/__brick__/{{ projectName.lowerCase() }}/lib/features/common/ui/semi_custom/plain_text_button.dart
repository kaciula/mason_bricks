import 'package:flutter/material.dart';

class PlainTextButton extends StatelessWidget {
  const PlainTextButton({
    super.key,
    required this.onPressed,
    this.label,
    this.child,
    this.padding,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final Widget? child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.padded,
        padding: padding,
      ),
      child: label != null ? Text(label!) : child!,
    );
  }
}
