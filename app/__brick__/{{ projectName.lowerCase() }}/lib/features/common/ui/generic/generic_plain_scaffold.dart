import 'package:flutter/material.dart';

class GenericPlainScaffold extends StatelessWidget {
  const GenericPlainScaffold({
    super.key,
    required this.appBar,
    required this.resizeToAvoidBottomInset,
    required this.extendBodyBehindAppBar,
    required this.backgroundColor,
    required this.body,
    required this.bottomNavigationBar,
    required this.endDrawer,
  });

  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final Color? backgroundColor;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? endDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      endDrawer: endDrawer,
    );
  }
}
