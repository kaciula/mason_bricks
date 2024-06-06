import 'package:flutter/material.dart';

class PlainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlainAppBar({
    super.key,
    required this.label,
    this.actions,
  });

  final String label;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(label),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
