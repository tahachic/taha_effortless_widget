import 'package:flutter/material.dart';

class TDottedLine extends StatelessWidget {
  const TDottedLine({
    super.key,
    this.isHorizontal,
    this.dashLength = 10,
    this.dashGapLength = 10,
    this.lineThickness = 2,
    this.dashColor,
    this.gapColor,
    this.dashRadius,
    required this.lineLength,
  });

  /// It is a horizontal Line ?
  final bool? isHorizontal;

  /// Length Of dash
  final double? dashLength;

  /// Length of the gap
  final double? dashGapLength;

  /// Line thikhness
  final double? lineThickness;

  /// Dash Color
  final Color? dashColor;

  /// Gap color
  final Color? gapColor;

  /// Dash Radius
  final double? dashRadius;

  /// Total Length
  final double lineLength;

  List<int> calculateDashAndDashGapCount(double lineLength) {
    var dashAndDashGapLength = dashLength! + dashGapLength!;
    var dashCount = lineLength ~/ dashAndDashGapLength;
    var dashGapCount = lineLength ~/ dashAndDashGapLength;
    if (dashLength! <= lineLength % dashAndDashGapLength) {
      dashCount += 1;
    }
    return [dashCount, dashGapCount];
  }

  @override
  Widget build(BuildContext context) {
    var dashAndDashGapCount = calculateDashAndDashGapCount(lineLength);
    final dashCount = dashAndDashGapCount[0];
    final dashGapCount = dashAndDashGapCount[1];
    return UnconstrainedBox(
      child: SizedBox(
        child: Wrap(
          direction: isHorizontal != null
              ? (isHorizontal! ? Axis.horizontal : Axis.vertical)
              : Axis.vertical,
          alignment: WrapAlignment.start,
          children: List.generate(dashCount + dashGapCount, (index) {
            if (index % 2 == 0) {
              return Container(
                width: isHorizontal != null
                    ? (isHorizontal! ? dashLength! : lineThickness!)
                    : lineThickness!,
                height: isHorizontal != null
                    ? (isHorizontal! ? lineThickness! : dashLength!)
                    : dashLength!,
                decoration: BoxDecoration(
                  color: dashColor ?? Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(dashRadius ?? 10),
                ),
              );
            } else {
              return Container(
                width: isHorizontal != null
                    ? (isHorizontal! ? dashGapLength! : lineThickness!)
                    : lineThickness!,
                height: isHorizontal != null
                    ? (isHorizontal! ? lineThickness! : dashGapLength!)
                    : dashGapLength!,
                decoration: BoxDecoration(
                  color: gapColor ?? Colors.transparent,
                  borderRadius: BorderRadius.circular(dashRadius ?? 10),
                ),
              );
            }
          }).toList(growable: false),
        ),
      ),
    );
  }
}
