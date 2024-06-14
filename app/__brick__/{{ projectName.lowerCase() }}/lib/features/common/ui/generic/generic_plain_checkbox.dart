import 'package:flutter/material.dart';

import '../../../../app/cubit/app_theme.dart';
import '../semi_custom/plain_constrained_box.dart';
import '../semi_custom/plain_gap.dart';
import '../semi_custom/plain_padding.dart';
import 'material_ink_well.dart';
import 'utils/build_context_extension.dart';

class GenericPlainCheckbox extends StatelessWidget {
  const GenericPlainCheckbox({
    super.key,
    required this.value,
    required this.prefix,
    required this.suffix,
    required this.suffixPadding,
    required this.onTap,
    required this.padding,
    required this.fullWidth,
    required this.iconScale,
    required this.minHeight,
    required this.maxHeight,
    required this.checkColor,
    required this.selectedFillColor,
    required this.selectedBorderColor,
    required this.unselectedFillColor,
    required this.unselectedBorderColor,
    required this.applyScaleFactor,
  });

  final bool? value;
  final Widget? prefix;
  final Widget? suffix;
  final double suffixPadding;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final bool fullWidth;
  final double iconScale;
  final double minHeight;
  final double maxHeight;
  final Color checkColor;
  final Color selectedFillColor;
  final Color selectedBorderColor;
  final Color unselectedFillColor;
  final Color unselectedBorderColor;
  final bool applyScaleFactor;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return MaterialInkWell(
      onTap: onTap,
      child: PlainConstrainedBox(
        minHeight: minHeight,
        maxHeight: maxHeight,
        applyScaleFactor: applyScaleFactor,
        child: PlainPadding(
          padding: padding,
          applyScaleFactor: applyScaleFactor,
          child: Row(
            children: [
              if (prefix != null) ...[
                fullWidth ? Expanded(child: prefix!) : prefix!,
                PlainGap(
                  12,
                  applyScaleFactor: applyScaleFactor,
                ),
              ],
              Transform.scale(
                scale: iconScale * scaleFactor,
                child: Checkbox(
                  value: value,
                  onChanged: (value) => onTap(),
                  checkColor: checkColor,
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return selectedFillColor;
                    }
                    return unselectedFillColor;
                  }),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: WidgetStateBorderSide.resolveWith(
                    (states) {
                      return BorderSide(
                        color: states.contains(WidgetState.selected)
                            ? selectedBorderColor
                            : unselectedBorderColor,
                        width: 1,
                      );
                    },
                  ),
                ),
              ),
              if (suffix != null) ...[
                PlainGap(
                  suffixPadding,
                  applyScaleFactor: applyScaleFactor,
                ),
                fullWidth ? Expanded(child: suffix!) : suffix!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
