import 'package:flutter/material.dart';

class GenericPlainWrap extends StatelessWidget {
  const GenericPlainWrap({
    super.key,
    required this.spacing,
    this.runSpacing,
    required this.children,
  });

  final double? spacing;
  final double? runSpacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing ?? 0.0,
      runSpacing: runSpacing ?? 0.0,
      children: children,
    );
  }
}
