import 'package:flutter/material.dart';

import '../../../../app/cubit/app_theme.dart';
import '../generic/utils/build_context_extension.dart';

class PlainPadding extends StatelessWidget {
  const PlainPadding({
    super.key,
    required this.padding,
    this.applyScaleFactor = true,
    required this.child,
  });

  final EdgeInsets padding;
  final bool applyScaleFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return Padding(
      padding: scaleFactor != 1
          ? EdgeInsets.only(
              left: padding.left * scaleFactor,
              top: padding.top * scaleFactor,
              right: padding.right * scaleFactor,
              bottom: padding.bottom * scaleFactor,
            )
          : padding,
      child: child,
    );
  }
}
