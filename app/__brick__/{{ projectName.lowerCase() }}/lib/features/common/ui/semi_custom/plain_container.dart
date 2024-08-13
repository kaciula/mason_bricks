import 'package:flutter/cupertino.dart';

import '../../../../app/cubit/app_theme.dart';
import '../constants.dart';
import '../generic/utils/build_context_extension.dart';

class PlainContainer extends StatelessWidget {
  const PlainContainer({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.applyScaleFactor = applyScaleFactorGlobally,
    this.child,
  });

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final bool applyScaleFactor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return Container(
      width: width != null ? width! * scaleFactor : null,
      height: height != null ? height! * scaleFactor : null,
      margin: margin != null && scaleFactor != 1
          ? EdgeInsets.only(
              left: margin!.left * scaleFactor,
              top: margin!.top * scaleFactor,
              right: margin!.right * scaleFactor,
              bottom: margin!.bottom * scaleFactor,
            )
          : margin,
      padding: padding != null && scaleFactor != 1
          ? EdgeInsets.only(
              left: padding!.left * scaleFactor,
              top: padding!.top * scaleFactor,
              right: padding!.right * scaleFactor,
              bottom: padding!.bottom * scaleFactor,
            )
          : padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      child: child,
    );
  }
}
