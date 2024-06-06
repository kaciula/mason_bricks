import 'package:flutter/material.dart';

class GenericCircularProgress extends StatelessWidget {
  const GenericCircularProgress({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
