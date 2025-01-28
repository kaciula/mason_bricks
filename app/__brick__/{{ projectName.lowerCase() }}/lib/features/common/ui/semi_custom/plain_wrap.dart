import 'package:flutter/material.dart';

import '../../../../app/cubit/app_theme.dart';
import '../constants.dart';
import '../generic/generic_plain_wrap.dart';
import '../generic/utils/build_context_extension.dart';

class PlainWrap extends StatelessWidget {
  const PlainWrap({
    super.key,
    this.spacing,
    this.runSpacing,
    this.applyScaleFactor = applyScaleFactorGlobally,
    required this.children,
  });

  final double? spacing;
  final double? runSpacing;
  final bool applyScaleFactor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return GenericPlainWrap(
      spacing: spacing != null ? spacing! * scaleFactor : null,
      runSpacing: runSpacing != null ? runSpacing! * scaleFactor : null,
      children: children,
    );
  }
}
