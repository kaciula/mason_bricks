import 'package:flutter/widgets.dart';

import '../../../../app/cubit/app_theme.dart';
import '../generic/utils/build_context_extension.dart';

class PlainConstrainedBox extends StatelessWidget {
  const PlainConstrainedBox({
    super.key,
    this.minWidth = 0,
    this.maxWidth = double.infinity,
    this.minHeight = 0,
    this.maxHeight = double.infinity,
    this.applyScaleFactor = true,
    required this.child,
  });

  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final bool applyScaleFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth * scaleFactor,
        maxWidth: maxWidth * scaleFactor,
        minHeight: minHeight * scaleFactor,
        maxHeight: maxHeight * scaleFactor,
      ),
      child: child,
    );
  }
}
