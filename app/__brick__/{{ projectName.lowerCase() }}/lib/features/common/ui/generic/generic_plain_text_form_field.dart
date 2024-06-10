import 'package:flutter/material.dart';

class GenericPlainTextFormField extends StatelessWidget {
  const GenericPlainTextFormField({
    super.key,
    required this.enabled,
    required this.textStyle,
    required this.hintText,
    required this.hintStyle,
    required this.textCapitalization,
    required this.textInputType,
    required this.obscureText,
    required this.controller,
    required this.focusNode,
    required this.initialValue,
    required this.onChanged,
    required this.fillColor,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.suffixIconConstraints,
    required this.autofocus,
    required this.validator,
    required this.maxLength,
    required this.minLines,
    required this.maxLines,
    required this.contentPadding,
    required this.cursorColor,
    required this.errorText,
    required this.autovalidateMode,
    required this.textAlign,
    required this.border,
    required this.enabledBorder,
    required this.focusedBorder,
    required this.errorBorder,
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
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Color? fillColor;
  final bool autofocus;
  final EdgeInsets? contentPadding;
  final Color? cursorColor;
  final String? errorText;
  final AutovalidateMode? autovalidateMode;
  final TextAlign textAlign;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      initialValue: initialValue,
      textCapitalization: textCapitalization,
      keyboardType: textInputType,
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      textAlign: textAlign,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        prefixIcon: prefixIcon,
        contentPadding: contentPadding,
        errorText: errorText,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
      ),
      style: textStyle,
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      cursorColor: cursorColor,
    );
  }
}
