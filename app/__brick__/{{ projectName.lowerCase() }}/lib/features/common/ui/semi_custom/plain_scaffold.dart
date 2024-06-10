import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/app_styles.dart';

class PlainScaffold extends StatelessWidget {
  const PlainScaffold({
    super.key,
    this.appBar,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
    this.backgroundColor = AppColors.bgColor,
    this.isStatusBarDark = true,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.endDrawer,
  });

  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar;
  final Color? backgroundColor;
  final bool isStatusBarDark;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? endDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      backgroundColor: backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: (isStatusBarDark
                ? SystemUiOverlayStyle.dark
                : SystemUiOverlayStyle.light)
            .copyWith(statusBarColor: AppColors.transparent),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      endDrawer: endDrawer,
    );
  }
}
