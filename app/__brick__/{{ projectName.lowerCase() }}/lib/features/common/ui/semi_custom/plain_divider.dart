import 'package:flutter/material.dart';
import 'package:kozmoz/app/app_styles.dart';

class PlainDivider extends StatelessWidget {
  const PlainDivider({
    super.key,
    this.color = AppColors.grey99,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: 1,
    );
  }
}
