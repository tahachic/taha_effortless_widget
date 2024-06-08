import 'package:flutter/material.dart';

class TGridViewBuilder extends StatelessWidget {
  const TGridViewBuilder({
    super.key,
    required this.length,
    required this.builder,
    required this.maxCrossAxisCount,
    this.horizontalSpacing,
    this.verticalSpacing,
    this.verticalExtent,
    this.childAspectRatio,
  });

  /// The GridView [Items] length
  final int length;

  /// The GridView builder to build each item
  final NullableIndexedWidgetBuilder builder;

  /// The Max items before return to line
  final int maxCrossAxisCount;

  /// The [horizontalSpacing] between items
  final double? horizontalSpacing;

  /// The [verticalSpacing] between items
  final double? verticalSpacing;

  /// The [verticalExtent] is The item height ,if null the aspectratio will replace it
  final double? verticalExtent;

  /// The [childAspectRatio] of The item default to 1
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: length > 0
            ? length > maxCrossAxisCount
                ? maxCrossAxisCount
                : length
            : 1,
        mainAxisSpacing: verticalSpacing ?? 0,
        crossAxisSpacing: horizontalSpacing ?? 0,
        childAspectRatio: childAspectRatio ?? 1,
        mainAxisExtent: verticalExtent,
      ),
      itemBuilder: builder,
    );
  }
}
