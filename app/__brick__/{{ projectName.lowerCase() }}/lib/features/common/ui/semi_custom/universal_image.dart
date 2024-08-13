import 'package:flutter/material.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_styles.dart';
import 'package:{{ projectName.snakeCase() }}/app/cubit/app_theme.dart';
import 'package:{{ projectName.snakeCase() }}/features/common/ui/generic/utils/build_context_extension.dart';

import '../constants.dart';
import '../generic/generic_universal_image.dart';

class UniversalImage extends StatelessWidget {
  const UniversalImage(
    this.uri, {
    super.key,
    this.color,
    this.colorBlendMode,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit,
    this.isCircle = false,
    this.useCaching = true,
    this.loadingPlaceholder,
    this.applyScaleFactor = applyScaleFactorGlobally,
  });

  final String? uri;
  final Color? color;
  final BlendMode? colorBlendMode;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final bool isCircle;
  final bool useCaching;
  final Widget? loadingPlaceholder;
  final bool applyScaleFactor;

  @override
  Widget build(BuildContext context) {
    final double scaleFactor =
        applyScaleFactor ? context.theme.appThemeExtension.scaleFactor : 1;
    return GenericUniversalImage(
      uri,
      color: color,
      colorBlendMode: colorBlendMode,
      width: width != null ? width! * scaleFactor : null,
      height: height != null ? height! * scaleFactor : null,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      isCircle: isCircle,
      useCaching: useCaching,
      errorColor: AppColors.errorColor,
      loadingPlaceholder: loadingPlaceholder,
      errorPlaceholder: null,
    );
  }
}
