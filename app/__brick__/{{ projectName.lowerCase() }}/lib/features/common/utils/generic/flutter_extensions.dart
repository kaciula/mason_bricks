import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get errorColor => Theme.of(this).errorColor;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ScaffoldExt on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          SnackBar snackbar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackbar);
}
