import 'package:flutter/widgets.dart';

import '../../../../app/cubit/app_theme.dart';
import '../generic/utils/build_context_extension.dart';

class PlainPositioned extends StatelessWidget {
  const PlainPositioned({
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.applyScaleFactor = true,
    required this.child,
  });

  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final bool applyScaleFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return Positioned(
      left: left != null ? left! * scaleFactor : null,
      top: top != null ? top! * scaleFactor : null,
      right: right != null ? right! * scaleFactor : null,
      bottom: bottom != null ? bottom! * scaleFactor : null,
      child: child,
    );
  }
}
