import 'package:flutter/material.dart';

class TCarouselIndicators extends StatelessWidget {
  const TCarouselIndicators({
    super.key,
    required this.activeIndex,
    required this.length,
    this.height,
    this.width,
    this.activeColor,
    this.noActiveColor,
    this.radius,
  });

  /// Current Index to be highlighted
  final int activeIndex;

  /// Number of Carousel Item
  final int length;

  /// Height of indexs default to [6 Pixels]
  final double? height;

  /// Width of highlighted index default to [20 Pixels]
  final double? width;

  /// Color of highlighted index default to [Colors.Black]
  final Color? activeColor;

  /// Color of no active index default to [Colors.grey.shade200]
  final Color? noActiveColor;

  /// Radius of indicators default to [3]
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          height: height ?? 6,
          width: activeIndex == index
              ? width ?? 20
              : width != null
                  ? width! / 2
                  : 10,
          decoration: BoxDecoration(
            color: activeIndex == index
                ? activeColor ?? Colors.black
                : noActiveColor ?? Colors.grey.shade200,
            borderRadius: radius != null
                ? BorderRadius.circular(radius!)
                : BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
