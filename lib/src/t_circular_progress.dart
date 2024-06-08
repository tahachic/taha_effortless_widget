import 'package:flutter/material.dart';

class TCircularProgress extends StatelessWidget {
  const TCircularProgress({
    super.key,
    this.diameter,
    this.color,
    this.strokeWidth,
  });

  /// diameter
  final double? diameter;

  /// Color
  final Color? color;

  /// thikhness of the circular indicator
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: diameter ?? 40,
      width: diameter ?? 40,
      child: CircularProgressIndicator(
        color: color ?? Colors.grey.shade200,
        strokeWidth: strokeWidth ?? 1,
      ),
    );
  }
}
