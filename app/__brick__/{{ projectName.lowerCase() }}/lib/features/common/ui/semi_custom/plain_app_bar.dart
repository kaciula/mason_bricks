import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/app_styles.dart';

class PlainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlainAppBar({
    super.key,
    required this.label,
    this.isStatusBarDark = true,
    this.actions,
  });

  final String label;
  final bool isStatusBarDark;
  final List<Widget>? actions;

  static AppBarTheme primaryTheme(double scaleFactor) => AppBarTheme();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(label),
      systemOverlayStyle: (isStatusBarDark
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light)
          .copyWith(statusBarColor: AppColors.transparent),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
