import 'package:flutter/material.dart';

enum ButtonState { idle, loading, success, fail }

enum RadiusSides { topLeft, topRight, bottomLeft, bottomRight, all }

class TButton extends StatelessWidget {
  const TButton({
    super.key,
    required this.onTap,
    this.radius,
    this.backgroundColor = const Color.fromRGBO(238, 238, 238, 1),
    this.withShadow,
    required this.child,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderColor,
    this.borderWidth,
    this.height,
    this.width,
    this.margin,
    this.enable,
    this.animationDuration,
    this.state,
    this.failColor = Colors.redAccent,
    this.successColor = Colors.green,
    this.loadingWidget,
    this.successWidget,
    this.failWidget,
    this.loadingIndicatorColor,
    this.radiusSides,
  });

  /// onTap CallBack
  final VoidCallback onTap;

  /// Button radius default to [5]
  final double? radius;

  /// Button Background Color default to [Colors.grey.shade200]
  final Color? backgroundColor;

  /// if there is shadow default to [false]
  final bool? withShadow;

  /// Button Child
  final Widget child;

  /// Button Vertical Padding
  final double? verticalPadding;

  /// Button Horizontal Padding
  final double? horizontalPadding;

  /// Button border Color ,if not null border width is equal to 1
  final Color? borderColor;

  /// Button border width ,if not null border Color is [Colors.black]
  final double? borderWidth;

  /// Button height
  final double? height;

  /// Button width
  final double? width;

  /// Button margin
  final EdgeInsets? margin;

  /// enable or disable button
  final bool? enable;

  /// animationDuration ,is state is controled
  final int? animationDuration;

  /// button State [idle,loading,fail,succes]
  final ButtonState? state;

  /// Button fail Color
  final Color? failColor;

  /// Button succes Color
  final Color? successColor;

  /// Button Loading Widget ,if null [CircularProgressIndicator] is implemented
  final Widget? loadingWidget;

  /// Button succes Widget ,if null [child] is implemented
  final Widget? successWidget;

  /// Button fail Widget ,if null [child] is implemented
  final Widget? failWidget;

  /// Button Loading Indicator Color if Loading widget is null
  final Color? loadingIndicatorColor;

  /// Button radius Sides
  final List<RadiusSides>? radiusSides;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        margin: margin,
        child: Material(
          borderRadius: _getBorderRadius(),
          color: _getColor(),
          surfaceTintColor: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(radius ?? 5),
            highlightColor: Colors.white24,
            onTap: _getOnTapCallback(),
            child: AnimatedContainer(
              duration: Duration(milliseconds: animationDuration ?? 200),
              height: height,
              width: _getWidth(),
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 10,
                horizontal: horizontalPadding ?? 15,
              ),
              alignment: Alignment.center,
              decoration: _getDecoration(),
              child: _getChild(),
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius? _getBorderRadius() {
    if (radius == null) return null;
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

  Color _getColor() {
    if (enable == null || enable!) {
      switch (state) {
        case ButtonState.success:
          return successColor!.withOpacity(1);
        case ButtonState.fail:
          return failColor!.withOpacity(1);
        default:
          return backgroundColor!.withOpacity(1);
      }
    }
    return backgroundColor != null && backgroundColor! != Colors.transparent
        ? backgroundColor!.withOpacity(backgroundColor!.opacity - 0.1)
        : Colors.grey.shade100.withOpacity(0.5);
  }

  VoidCallback? _getOnTapCallback() {
    if (enable == null || enable!) {
      return onTap;
    }
    return () {};
  }

  double? _getWidth() {
    if (state == ButtonState.loading && width != null) {
      return width! - width! / 2;
    }
    return width;
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      borderRadius: _getBorderRadius(),
      border: _getBorder(),
      color: backgroundColor == Colors.white &&
              (state == ButtonState.idle ||
                  state == ButtonState.loading ||
                  state == null)
          ? Colors.white
          : Colors.transparent,
      boxShadow: withShadow != null && withShadow!
          ? [
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 3,
                  color: Colors.black.withOpacity(0.05))
            ]
          : null,
    );
  }

  BoxBorder? _getBorder() {
    if (borderWidth != null) {
      return Border.all(
          width: borderWidth!, color: borderColor ?? Colors.black);
    }
    if (borderColor != null) {
      return Border.all(width: 1, color: borderColor!);
    }
    return null;
  }

  Widget _getChild() {
    switch (state) {
      case ButtonState.loading:
        return Container(
          constraints: BoxConstraints(
            maxHeight: height == null ? 25 : height! - 20,
            maxWidth: height == null ? 25 : height! - 20,
          ),
          child: loadingWidget ??
              CircularProgressIndicator(
                strokeWidth: 1,
                color: loadingIndicatorColor ?? Colors.white,
              ),
        );
      case ButtonState.fail:
        return failWidget ?? child;
      case ButtonState.success:
        return successWidget ?? child;
      default:
        return child;
    }
  }
}
