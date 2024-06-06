import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';

class PlainDivider extends StatelessWidget {
  const PlainDivider({
    super.key,
    this.color = AppColors.black,
  });

  final Color color;

  static DividerThemeData primaryTheme(double scaleFactor) =>
      DividerThemeData();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: 1,
    );
  }
}
