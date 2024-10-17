import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';

class PlainDivider extends StatelessWidget {
  const PlainDivider({
    super.key,
    this.color = AppColors.greyE8E,
    this.indent = 0,
    this.endIndent = 0,
  });

  final Color color;
  final double? indent;
  final double? endIndent;

  static DividerThemeData primaryTheme(double scaleFactor) =>
      DividerThemeData();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: 1,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
