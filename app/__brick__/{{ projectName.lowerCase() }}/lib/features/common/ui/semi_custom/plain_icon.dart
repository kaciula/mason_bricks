import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';
import '../../../../app/cubit/app_theme.dart';
import '../generic/utils/build_context_extension.dart';

class PlainIcon extends StatelessWidget {
  const PlainIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.applyScaleFactor = true,
  });

  final IconData icon;
  final double? size;
  final Color? color;
  final bool applyScaleFactor;

  static IconThemeData primaryTheme(double scaleFactor) =>
      IconThemeData(size: 24 * scaleFactor);

  static IconThemeData appBarIconTheme(double scaleFactor) => IconThemeData(
        size: 24 * scaleFactor,
        color: AppColors.black,
      );

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return Icon(
      icon,
      size: size != null ? size! * scaleFactor : null,
      color: color,
    );
  }
}
