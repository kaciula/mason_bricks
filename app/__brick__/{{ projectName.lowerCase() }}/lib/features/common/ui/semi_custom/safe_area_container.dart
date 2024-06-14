import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';
import 'plain_container.dart';

class SafeAreaContainer extends StatelessWidget {
  const SafeAreaContainer({
    super.key,
    this.backgroundDecoration,
    this.mainColor = AppColors.transparent,
    this.bottomColor = AppColors.transparent,
    required this.child,
  });

  final BoxDecoration? backgroundDecoration;
  final Color mainColor;
  final Color bottomColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PlainContainer(
      decoration: backgroundDecoration,
      child: SafeArea(
        bottom: false,
        child: PlainContainer(
          color: bottomColor,
          child: SafeArea(
            child: PlainContainer(
              color: mainColor,
              height: double.infinity,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
