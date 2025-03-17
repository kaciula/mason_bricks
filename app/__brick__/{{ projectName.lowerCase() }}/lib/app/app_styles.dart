import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color red = Colors.red;
  static const Color pink = Colors.pink;
  static const Color green = Colors.green;
  static const Color blue = Colors.blue;

  static const Color grey99 = Color(0xFF999999);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Semantic colors
  static const Color bg = white;
  static const Color main = green;
  static const Color error = red;
}

class AppFonts {
  AppFonts._();

  static const String roboto = 'Roboto';
}

class AppIcons {
  AppIcons._();
}

extension ColorExt on Color {
  /// Extension on [Color] to resolve opacity based on a [double] value.
  /// The opacity is expected to be between 0.0 (fully transparent) and 1.0 (fully opaque).
  /// Returns a new color with the applied opacity.
  Color resolveOpacity(double opacity) {
    opacity = opacity.clamp(0.0, 1.0);
    int alpha = (opacity * 255).round();
    return withAlpha(alpha);
  }
}
