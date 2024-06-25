import 'package:flutter/widgets.dart';

import '../../../../app/cubit/app_theme.dart';
import '../generic/utils/build_context_extension.dart';

class PlainSizedBox extends StatelessWidget {
  const PlainSizedBox({
    super.key,
    this.width,
    this.height,
    this.applyScaleFactor = true,
    required this.child,
  });

  final double? width;
  final double? height;
  final bool applyScaleFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return SizedBox(
      width: width != null ? width! * scaleFactor : null,
      height: height != null ? height! * scaleFactor : null,
      child: child,
    );
  }
}
