import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';
import '../generic/material_ink_well.dart';
import 'plain_gap.dart';
import 'plain_padding.dart';

class PlainCheckbox extends StatelessWidget {
  const PlainCheckbox({
    super.key,
    required this.value,
    this.prefix,
    this.suffix,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
  });

  final bool? value;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return MaterialInkWell(
      onTap: onTap,
      child: PlainPadding(
        padding: padding,
        child: Row(
          children: [
            if (prefix != null) ...[
              prefix!,
              PlainGap(12),
            ],
            SizedBox(
              height: 19,
              width: 19,
              child: Checkbox(
                value: value,
                onChanged: (value) => onTap(),
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.mainColor;
                  }
                  return AppColors.white;
                }),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: MaterialStateBorderSide.resolveWith(
                  (states) {
                    return BorderSide(
                      color: states.contains(MaterialState.selected)
                          ? AppColors.white.withOpacity(0.16)
                          : AppColors.mainColor,
                      width: 1,
                    );
                  },
                ),
              ),
            ),
            if (suffix != null) ...[
              PlainGap(12),
              Expanded(child: suffix!),
            ],
          ],
        ),
      ),
    );
  }
}
