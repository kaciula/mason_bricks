import 'package:flutter/material.dart';
import 'package:kozmoz/app/app_styles.dart';

import '../generic/generic_plain_text_form_field.dart';

// Customize using the inputDecorationTheme in the theme and then do extra customizations here
class PlainTextFormField extends StatelessWidget {
  const PlainTextFormField({
    super.key,
    this.fontSize = 15,
    this.textColor = AppColors.blackish,
    this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.autofocus = false,
    this.validator,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.contentPadding,
    this.cursorColor = AppColors.blackish,
    this.errorText,
    this.autovalidateMode,
  });

  final double? fontSize;
  final Color textColor;
  final String? hintText;
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
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Color? fillColor;
  final bool autofocus;
  final EdgeInsets? contentPadding;
  final Color cursorColor;
  final String? errorText;
  final AutovalidateMode? autovalidateMode;

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: _unfocusedBorder,
    enabledBorder: _unfocusedBorder,
    focusedBorder: _focusedBorder,
    fillColor: AppColors.white,
    filled: true,
    hintStyle: TextStyle(
      fontSize: 15,
      color: AppColors.grey77,
    ),
    contentPadding:
        const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 18),
    errorBorder: _errorBorder,
    errorStyle: TextStyle(
      fontSize: 14,
      color: AppColors.red,
    ),
  );

  static final BorderRadius _borderRadius = BorderRadius.circular(6);
  static const double _borderWidth = 1;

  static final OutlineInputBorder _unfocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.white.withOpacity(0.16),
      width: _borderWidth,
    ),
    borderRadius: _borderRadius,
  );

  static final OutlineInputBorder _focusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.purple,
      width: _borderWidth,
    ),
    borderRadius: _borderRadius,
  );

  static final OutlineInputBorder _errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.red,
      width: _borderWidth,
    ),
    borderRadius: _borderRadius,
  );

  @override
  Widget build(BuildContext context) {
    return GenericPlainTextFormField(
      fontSize: fontSize,
      textColor: textColor,
      hintText: hintText,
      textCapitalization: textCapitalization,
      textInputType: textInputType,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      onChanged: onChanged,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
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
    );
  }
}
