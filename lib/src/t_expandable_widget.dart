import 'package:flutter/material.dart';

class TExpandableWidget extends StatefulWidget {
  const TExpandableWidget({
    super.key,
    required this.title,
    required this.expandedContent,
    this.backgroundColor,
    this.radius,
    this.borderWidth,
    this.borderColor,
    this.margin,
    this.padding,
    this.animatedTitleIcon,
    this.simpleTitleIcon,
    this.titleIconColor,
    this.width,
  });

  /// background Color
  final Color? backgroundColor;

  /// Container radius
  final double? radius;

  /// Container borderWidth
  final double? borderWidth;

  /// Container borderColor
  final Color? borderColor;

  /// Container margin
  final EdgeInsets? margin;

  /// Container padding
  final EdgeInsets? padding;

  /// Title of expandable widget
  final Widget title;

  /// Animated Icon to be associated with the title
  final AnimatedIconData? animatedTitleIcon;

  /// Simple Icon to be associated with the title
  final IconData? simpleTitleIcon;

  /// Icon Color
  final Color? titleIconColor;

  /// Hiden content
  final Widget expandedContent;

  /// Container width
  final double? width;

  @override
  State<TExpandableWidget> createState() => _TExpandableWidgetState();
}

class _TExpandableWidgetState extends State<TExpandableWidget>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      constraints: const BoxConstraints(minWidth: 120),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey.shade100,
        borderRadius: BorderRadius.circular(widget.radius ?? 0),
        border: widget.borderWidth != null
            ? Border.all(
                width: widget.borderWidth!,
                color: widget.borderColor ?? Colors.black)
            : null,
      ),
      margin: widget.margin ??
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
                isExpanded ? _controller.reverse() : _controller.forward();
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.title,
                const Expanded(child: SizedBox()),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: widget.animatedTitleIcon != null
                      ? AnimatedIcon(
                          icon: widget.animatedTitleIcon!,
                          progress: _controller,
                          color: widget.titleIconColor)
                      : widget.simpleTitleIcon != null
                          ? Icon(widget.simpleTitleIcon,
                              color: widget.titleIconColor)
                          : null,
                ),
              ],
            ),
          ),
          isExpanded ? widget.expandedContent : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
