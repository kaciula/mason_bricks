import 'package:{{ projectName.snakeCase() }}/app/app_styles.dart';
import 'package:flutter/material.dart';

import '../generic/generic_circular_progress.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    super.key,
    this.color = AppColors.mainColor,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GenericCircularProgress(color: color);
  }
}
