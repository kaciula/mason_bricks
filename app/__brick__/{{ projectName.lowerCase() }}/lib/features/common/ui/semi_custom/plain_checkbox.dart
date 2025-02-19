import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';
import '../constants.dart';
import '../generic/generic_plain_checkbox.dart';

class PlainCheckbox extends StatelessWidget {
  const PlainCheckbox({
    super.key,
    required this.value,
    this.prefix,
    this.suffix,
    this.suffixPadding = 8,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.fullWidth = true,
    this.iconScale = 1,
    this.minHeight = 0,
    this.maxHeight = double.infinity,
    this.checkColor = AppColors.white,
    this.selectedFillColor = AppColors.main,
    this.selectedBorderColor = AppColors.main,
    this.unselectedFillColor = AppColors.grey99,
    this.unselectedBorderColor,
    this.applyScaleFactor = applyScaleFactorGlobally,
  });

  final bool? value;
  final Widget? prefix;
  final Widget? suffix;
  final double suffixPadding;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final bool fullWidth;
  final double iconScale;
  final double minHeight;
  final double maxHeight;
  final Color checkColor;
  final Color selectedFillColor;
  final Color selectedBorderColor;
  final Color unselectedFillColor;
  final Color? unselectedBorderColor;
  final bool applyScaleFactor;

  @override
  Widget build(BuildContext context) {
    return GenericPlainCheckbox(
      value: value,
      prefix: prefix,
      suffix: suffix,
      suffixPadding: suffixPadding,
      onTap: onTap,
      padding: padding,
      fullWidth: fullWidth,
      iconScale: iconScale,
      minHeight: minHeight,
      maxHeight: maxHeight,
      checkColor: checkColor,
      selectedFillColor: selectedFillColor,
      selectedBorderColor: selectedBorderColor,
      unselectedFillColor: unselectedFillColor,
      unselectedBorderColor:
          unselectedBorderColor ?? AppColors.black.withOpacity(0.15),
      applyScaleFactor: applyScaleFactor,
    );
  }
}
