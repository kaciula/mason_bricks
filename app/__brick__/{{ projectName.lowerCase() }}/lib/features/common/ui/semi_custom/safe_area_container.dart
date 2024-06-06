import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';

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
    return Container(
      decoration: backgroundDecoration,
      child: SafeArea(
        bottom: false,
        child: Container(
          color: bottomColor,
          child: SafeArea(
            child: Container(
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
