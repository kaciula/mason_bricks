import 'package:flutter/material.dart';

class MaterialInkWell extends StatefulWidget {
  const MaterialInkWell({
    super.key,
    this.onTap,
    this.onLongPress,
    this.onTapWithPosition,
    this.onLongPressWithPosition,
    required this.child,
    this.elevation = 0,
    this.color,
    this.materialColor = Colors.transparent,
    this.borderRadius,
    this.border,
    this.shape = BoxShape.rectangle,
    this.padding,
    this.decoration,
  });

  final VoidCallback? onTap;
  final TapWithPositionCallback? onTapWithPosition;
  final VoidCallback? onLongPress;
  final TapWithPositionCallback? onLongPressWithPosition;
  final Widget child;
  final double elevation;
  final Color? color;
  final Color materialColor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final BoxShape shape;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;

  @override
  State<MaterialInkWell> createState() => _MaterialInkWellState();
}

class _MaterialInkWellState extends State<MaterialInkWell> {
  RelativeRect? _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: widget.borderRadius ??
          (widget.decoration?.borderRadius as BorderRadius?),
      elevation: widget.elevation,
      color: widget.materialColor,
      child: InkWell(
        onTap: () {
          if (widget.onTapWithPosition != null) {
            widget.onTapWithPosition!.call(_currentPosition!);
          } else {
            widget.onTap?.call();
          }
        },
        onTapDown: _onTapDown,
        onLongPress: () {
          if (widget.onLongPressWithPosition != null) {
            // Some crash reports show that it is possible to reach here with a null position
            if (_currentPosition != null) {
              widget.onLongPressWithPosition!.call(_currentPosition!);
            }
          } else {
            widget.onLongPress?.call();
          }
        },
        borderRadius: widget.borderRadius ??
            (widget.decoration?.borderRadius as BorderRadius?),
        child: Ink(
          decoration: widget.decoration ??
              BoxDecoration(
                color: widget.color,
                borderRadius: widget.borderRadius,
                border: widget.border,
                shape: widget.shape,
              ),
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    final Offset tapPosition = details.globalPosition;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final Size size = overlay.paintBounds.size;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromLTWH(tapPosition.dx, tapPosition.dy + 24, 100, 100),
      Rect.fromLTWH(0, 0, size.width, size.height),
    );

    setState(() {
      _currentPosition = position;
    });
  }
}

typedef TapWithPositionCallback = void Function(RelativeRect position);
