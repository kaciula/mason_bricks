import 'package:flutter/material.dart';

class PlainVisibility extends StatelessWidget {
  const PlainVisibility({
    super.key,
    required this.visible,
    this.occupySpaceWhenInvisible = true,
    required this.child,
  });

  final bool visible;
  final bool occupySpaceWhenInvisible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      maintainSize: occupySpaceWhenInvisible,
      maintainState: occupySpaceWhenInvisible,
      maintainAnimation: occupySpaceWhenInvisible,
      child: child,
    );
  }
}
