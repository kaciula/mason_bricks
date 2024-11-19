import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';
import '../constants.dart';
import '../generic/generic_plain_radio.dart';

class PlainRadio<T> extends StatelessWidget {
  const PlainRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.prefix,
    this.suffix,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.fullWidth = true,
    this.iconScale = 1,
    this.minHeight = 0,
    this.maxHeight = 32,
    this.selectedFillColor = AppColors.main,
    this.unselectedFillColor = AppColors.black,
    this.applyScaleFactor = applyScaleFactorGlobally,
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
    return GenericPlainRadio(
      value: value,
      groupValue: groupValue,
      prefix: prefix,
      suffix: suffix,
      onTap: onTap,
      padding: padding,
      fullWidth: fullWidth,
      iconScale: iconScale,
      minHeight: minHeight,
      maxHeight: maxHeight,
      selectedFillColor: selectedFillColor,
      unselectedFillColor: unselectedFillColor,
      applyScaleFactor: applyScaleFactor,
    );
  }
}
