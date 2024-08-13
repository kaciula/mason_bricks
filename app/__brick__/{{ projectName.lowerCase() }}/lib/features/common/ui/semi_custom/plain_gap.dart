import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../../app/cubit/app_theme.dart';
import '../constants.dart';
import '../generic/utils/build_context_extension.dart';

class PlainGap extends StatelessWidget {
  const PlainGap(
    this.mainAxisExtent, {
    super.key,
    this.applyScaleFactor = applyScaleFactorGlobally,
  });

  final double mainAxisExtent;
  final bool applyScaleFactor;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return Gap(mainAxisExtent * scaleFactor);
  }
}
