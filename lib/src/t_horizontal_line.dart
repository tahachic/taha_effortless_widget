import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    super.key,
    required this.width,
    this.thickness,
    this.color,
    this.sidePadding,
  });

  /// Lign Width
  final double width;

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
        width: width,
        height: thickness ?? 1,
        color: color ?? Colors.black.withOpacity(0.1),
      ),
    );
  }
}
