import 'package:flutter/material.dart';

import '../../../../app/cubit/app_theme.dart';
import '../semi_custom/plain_constrained_box.dart';
import 'utils/build_context_extension.dart';

class GenericPlainOutlinedButton extends StatelessWidget {
  const GenericPlainOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    required this.child,
    required this.minWidth,
    required this.maxWidth,
    required this.minHeight,
    required this.maxHeight,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.side,
    required this.padding,
    required this.shape,
    required this.applyScaleFactor,
  }) : assert(label != null || child != null);

  final VoidCallback? onPressed;
  final String? label;
  final Widget? icon;
  final Widget? child;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? side;
  final EdgeInsets? padding;
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
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding != null && scaleFactor != 1
              ? EdgeInsets.only(
                  left: padding!.left * scaleFactor,
                  top: padding!.top * scaleFactor,
                  right: padding!.right * scaleFactor,
                  bottom: padding!.bottom * scaleFactor,
                )
              : padding,
          side: side,
          shape: shape,
        ),
        child: _child(),
      ),
    );
  }

  Widget _child() {
    if (child != null) {
      return child!;
    }
    if (icon == null) {
      return Text(label!);
    }
    return PlainConstrainedBox(
      minWidth: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(label!),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: icon!,
          ),
        ],
      ),
    );
  }
}
