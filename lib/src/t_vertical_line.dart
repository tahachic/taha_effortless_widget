import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    super.key,
    required this.height,
    this.thickness,
    this.color,
    this.sidePadding,
  });

  /// line height
  final double height;

  /// line thikhness
  final double? thickness;

  /// line Color
  final Color? color;

  /// line spacing on each side
  final double? sidePadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: sidePadding != null
          ? EdgeInsets.symmetric(horizontal: sidePadding!)
          : const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: thickness ?? 1,
        height: height,
        color: color ?? Colors.black.withOpacity(0.1),
      ),
    );
  }
}
