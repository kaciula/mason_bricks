import 'package:flutter/material.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_styles.dart';

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

  @override
  Widget build(BuildContext context) {
    return GenericUniversalImage(
      uri,
      color: color,
      colorBlendMode: colorBlendMode,
      width: width,
      height: height,
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
