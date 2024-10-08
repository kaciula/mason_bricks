import 'package:{{ projectName.snakeCase() }}/app/app_strings.al.dart';
import 'package:{{ projectName.snakeCase() }}/app/app_styles.dart';
import 'package:flutter/material.dart';

import '../generic/generic_sure_dialog.dart';

class SureDialog extends StatelessWidget {
  const SureDialog({
    super.key,
    this.title,
    required this.msg,
    this.details,
    this.yesBtnLabel,
    this.noBtnLabel,
    required this.onYesPressed,
    this.onNoPressed,
  });

  final String? title;
  final String msg;
  final String? details;
  final String? yesBtnLabel;
  final String? noBtnLabel;
  final VoidCallback onYesPressed;
  final VoidCallback? onNoPressed;

  @override
  Widget build(BuildContext context) {
    return GenericSureDialog(
      title: title,
      msg: msg,
      details: details,
      yesBtnLabel: yesBtnLabel ?? Strings.genericYes.get(),
      noBtnLabel: noBtnLabel ?? Strings.genericNo.get(),
      onYesPressed: onYesPressed,
      onNoPressed: onNoPressed,
      isPlatformSpecific: true,
      cupertinoColor: AppColors.white,
    );
  }
}
