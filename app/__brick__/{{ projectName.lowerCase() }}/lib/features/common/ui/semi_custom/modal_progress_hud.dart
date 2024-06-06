import 'package:{{ projectName.snakeCase() }}/app/app_styles.dart';
import 'package:flutter/material.dart';

import '../generic/generic_modal_progress_hud.dart';
import 'circular_progress.dart';

class ModalProgressHUD extends StatelessWidget {
  const ModalProgressHUD({
    super.key,
    required this.inAsyncCall,
    this.color = AppColors.black,
    this.progressIndicator = const CircularProgress(),
    this.opacity = 0.3,
    this.expand = true,
    required this.child,
  });

  final bool inAsyncCall;
  final Color color;
  final Widget progressIndicator;
  final double opacity;
  final bool expand;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GenericModalProgressHUD(
      inAsyncCall: inAsyncCall,
      color: color,
      progressIndicator: progressIndicator,
      opacity: opacity,
      expand: expand,
      child: child,
    );
  }
}
