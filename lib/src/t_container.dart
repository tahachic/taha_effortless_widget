import 'package:flutter/material.dart';

import '../taha_effortless_widgets.dart';

class TContainer extends StatelessWidget {
  const TContainer({
    super.key,
    this.height,
    this.width,
    this.alignment,
    this.padding,
    this.margin,
    this.child,
    this.color,
    this.shape,
    this.borderColor,
    this.borderWidth,
    this.radius,
    this.radiusSides,
    this.gradientColors,
    this.gradientAlignment,
    this.shadow,
    this.animationDuration,
    this.image,
  });

  /// Container height
  final double? height;

  /// Container width
  final double? width;

  /// Child alignment inside the container
  final Alignment? alignment;

  /// Container padding
  final EdgeInsets? padding;

  /// Container margin
  final EdgeInsets? margin;

  /// Child
  final Widget? child;

  /// Container background Color
  final Color? color;

  /// Container shape default to [BoxShape.rectangle]
  final BoxShape? shape;

  /// BorderColor default to [Colors.black]
  final Color? borderColor;

  /// BorderWidth default to 2
  final double? borderWidth;

  /// BorderRadius default to [Radius.zero]
  final double? radius;

  /// Sides to implement radius
  final List<RadiusSides>? radiusSides;

  /// List of gradientColors
  final List<Color>? gradientColors;

  /// Alignment of GradientColors
  final Axis? gradientAlignment;

  /// List of Shadows to be implemented
  final List<BoxShadow>? shadow;

  /// animation duration
  final int? animationDuration;

  /// background Image
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: animationDuration ?? 0),
      height: height,
      width: width,
      alignment: alignment ?? Alignment.center,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: shadow,
        image: image != null
            ? DecorationImage(image: image!, fit: BoxFit.cover)
            : null,
        border: _getBorder(),
        borderRadius: _getBorderRadius(),
        color: color ?? Colors.grey.shade100,
        gradient: gradientColors != null
            ? LinearGradient(
                colors: gradientColors!,
                begin: gradientAlignment != null
                    ? gradientAlignment == Axis.horizontal
                        ? Alignment.centerLeft
                        : Alignment.topCenter
                    : Alignment.topCenter,
                end: gradientAlignment != null
                    ? gradientAlignment == Axis.horizontal
                        ? Alignment.centerRight
                        : Alignment.bottomCenter
                    : Alignment.bottomCenter,
              )
            : null,
        shape: shape ?? BoxShape.rectangle,
      ),
      child: child,
    );
  }

  BorderRadius? _getBorderRadius() {
    if (radius == null) return null;
    if (shape == BoxShape.circle) return null;
    if (radiusSides == null || radiusSides!.contains(RadiusSides.all)) {
      return BorderRadius.circular(radius!);
    }
    return BorderRadius.only(
      topLeft: radiusSides!.contains(RadiusSides.topLeft)
          ? Radius.circular(radius!)
          : Radius.zero,
      topRight: radiusSides!.contains(RadiusSides.topRight)
          ? Radius.circular(radius!)
          : Radius.zero,
      bottomRight: radiusSides!.contains(RadiusSides.bottomRight)
          ? Radius.circular(radius!)
          : Radius.zero,
      bottomLeft: radiusSides!.contains(RadiusSides.bottomLeft)
          ? Radius.circular(radius!)
          : Radius.zero,
    );
  }

  BoxBorder? _getBorder() {
    if (borderWidth != null) {
      return Border.all(
          width: borderWidth!, color: borderColor ?? Colors.black);
    }
    if (borderColor != null) {
      return Border.all(width: 2, color: borderColor!);
    }
    return null;
  }
}
