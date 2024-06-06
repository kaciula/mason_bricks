import 'package:flutter/material.dart';
import 'package:kozmoz/features/common/ui/semi_custom/plain_gap.dart';
import 'package:kozmoz/app/app_styles.dart';
import 'package:kozmoz/features/common/ui/generic/material_ink_well.dart';

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
      child: Padding(
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
                    return AppColors.purple;
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
                          : AppColors.purple,
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
