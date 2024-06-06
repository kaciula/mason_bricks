import 'package:flutter/material.dart';

import '../../../../app/cubit/app_theme.dart';
import '../semi_custom/plain_constrained_box.dart';
import '../semi_custom/plain_gap.dart';
import '../semi_custom/plain_padding.dart';
import 'material_ink_well.dart';
import 'utils/build_context_extension.dart';

class GenericPlainRadio<T> extends StatelessWidget {
  const GenericPlainRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.prefix,
    required this.suffix,
    required this.onTap,
    required this.padding,
    required this.fullWidth,
    required this.iconScale,
    required this.minHeight,
    required this.maxHeight,
    required this.selectedFillColor,
    required this.unselectedFillColor,
    required this.applyScaleFactor,
  });

  final T value;
  final T? groupValue;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final bool fullWidth;
  final double iconScale;
  final double minHeight;
  final double maxHeight;
  final Color selectedFillColor;
  final Color unselectedFillColor;
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
                child: Radio(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onTap != null ? (T? _) => onTap!.call() : null,
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return selectedFillColor;
                    }
                    return unselectedFillColor;
                  }),
                ),
              ),
              if (suffix != null) ...[
                PlainGap(
                  12,
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
