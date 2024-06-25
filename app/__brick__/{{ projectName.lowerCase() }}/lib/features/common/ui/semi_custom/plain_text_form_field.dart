import 'package:flutter/material.dart';

import '../../../../app/app_styles.dart';
import '../generic/generic_plain_text_form_field.dart';

// Customize using the inputDecorationTheme in the theme and then do extra customizations here
class PlainTextFormField extends StatelessWidget {
  const PlainTextFormField({
    super.key,
    this.enabled = true,
    this.textStyle = const TextStyle(fontSize: 16, color: AppColors.grey22),
    this.hintText,
    this.hintStyle,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.fillColor,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.autofocus = false,
    this.validator,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.contentPadding,
    this.cursorColor = AppColors.black,
    this.errorText,
    this.autovalidateMode,
    this.textAlign = TextAlign.start,
    this.borderRadius,
  });

  final bool enabled;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextCapitalization textCapitalization;
  final TextInputType? textInputType;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final void Function(String)? onChanged;
  final FormFieldValidator<String?>? validator;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Color? fillColor;
  final bool autofocus;
  final EdgeInsets? contentPadding;
  final Color cursorColor;
  final String? errorText;
  final AutovalidateMode? autovalidateMode;
  final TextAlign textAlign;
  final BorderRadius? borderRadius;

  static InputDecorationTheme primaryTheme(double scaleFactor) =>
      InputDecorationTheme(
        border: _unfocusedBorder,
        enabledBorder: _unfocusedBorder,
        focusedBorder: _focusedBorder,
        fillColor: AppColors.white,
        filled: true,
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppColors.black,
        ),
        contentPadding:
            const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 18),
        errorBorder: _errorBorder,
        errorStyle: TextStyle(
          fontSize: 14,
          color: AppColors.errorColor,
        ),
      );

  static final OutlineInputBorder _unfocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.white.withOpacity(0.16),
      width: _borderWidth,
    ),
    borderRadius: BorderRadius.circular(_borderRadius),
  );

  static final OutlineInputBorder _focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.mainColor,
      width: _borderWidth,
    ),
    borderRadius: BorderRadius.circular(_borderRadius),
  );

  static final OutlineInputBorder _errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.errorColor,
      width: _borderWidth,
    ),
    borderRadius: BorderRadius.circular(_borderRadius),
  );

  @override
  Widget build(BuildContext context) {
    return GenericPlainTextFormField(
      enabled: enabled,
      textStyle: textStyle,
      hintText: hintText,
      hintStyle: hintStyle,
      textCapitalization: textCapitalization,
      textInputType: textInputType,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      onChanged: onChanged,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      suffixIcon: suffixIcon,
      suffixIconConstraints: suffixIconConstraints,
      autofocus: autofocus,
      validator: validator,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      contentPadding: contentPadding,
      cursorColor: cursorColor,
      errorText: errorText,
      autovalidateMode: autovalidateMode,
      textAlign: textAlign,
      border: borderRadius != null
          ? _unfocusedBorder.copyWith(borderRadius: borderRadius)
          : null,
      enabledBorder: borderRadius != null
          ? _unfocusedBorder.copyWith(borderRadius: borderRadius)
          : null,
      focusedBorder: borderRadius != null
          ? _focusedBorder.copyWith(borderRadius: borderRadius)
          : null,
      errorBorder: borderRadius != null
          ? _errorBorder.copyWith(borderRadius: borderRadius)
          : null,
    );
  }
}

const double _borderWidth = 1;
const double _borderRadius = 5;
