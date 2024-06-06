import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kozmoz/app/app_styles.dart';

class PlainScaffold extends StatelessWidget {
  const PlainScaffold({
    super.key,
    this.appBar,
    this.resizeToAvoidBottomInset,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.endDrawer,
  });

  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? endDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: AppColors.transparent),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      endDrawer: endDrawer,
    );
  }
}
