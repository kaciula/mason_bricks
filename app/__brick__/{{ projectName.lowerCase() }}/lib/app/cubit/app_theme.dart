import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/common/ui/semi_custom/plain_app_bar.dart';
import '../../features/common/ui/semi_custom/plain_divider.dart';
import '../../features/common/ui/semi_custom/plain_elevated_button.dart';
import '../../features/common/ui/semi_custom/plain_icon.dart';
import '../../features/common/ui/semi_custom/plain_outlined_button.dart';
import '../../features/common/ui/semi_custom/plain_text_button.dart';
import '../../features/common/ui/semi_custom/plain_text_form_field.dart';
import '../app_styles.dart';

part 'app_theme.freezed.dart';

@freezed
class AppTheme with _$AppTheme {
  factory AppTheme({
    required ThemeMode themeMode,
    required double scaleFactor,
  }) = _AppTheme;

  AppTheme._();

  factory AppTheme.initial(ThemeMode themeMode) {
    return AppTheme(
      themeMode: themeMode,
      scaleFactor: 1,
    );
  }

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.main),
      brightness: Brightness.light,
      canvasColor: AppColors.bg,
      scaffoldBackgroundColor: AppColors.bg,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: PlainElevatedButton.primaryStyle(scaleFactor),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: PlainOutlinedButton.primaryStyle(scaleFactor),
      ),
      textButtonTheme: TextButtonThemeData(
        style: PlainTextButton.primaryStyle(scaleFactor),
      ),
      appBarTheme: PlainAppBar.primaryTheme(scaleFactor),
      iconTheme: PlainIcon.primaryTheme(scaleFactor),
      inputDecorationTheme: PlainTextFormField.primaryTheme(scaleFactor),
      dividerTheme: PlainDivider.primaryTheme(scaleFactor),
      extensions: [
        AppThemeExtension(scaleFactor: scaleFactor),
      ],
    );
  }

  ThemeData get darkThemeData => themeData;
}

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.scaleFactor,
  });

  final double scaleFactor;

  @override
  AppThemeExtension copyWith({double? scaleFactor}) {
    return AppThemeExtension(
      scaleFactor: scaleFactor ?? this.scaleFactor,
    );
  }

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      scaleFactor: lerpDouble(scaleFactor, other.scaleFactor, t)!,
    );
  }

  @override
  String toString() => 'AppThemeExtension(scaleFactor: $scaleFactor)';
}

extension AppThemeExt on ThemeData {
  AppThemeExtension get appThemeExtension => extension<AppThemeExtension>()!;
}
