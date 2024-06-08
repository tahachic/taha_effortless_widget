import 'package:flutter/material.dart';

class TListView extends StatelessWidget {
  const TListView({
    super.key,
    required this.builder,
    required this.length,
    this.separatorBuilder,
    this.isVertical,
  });

  /// Item count
  final int length;

  /// Is items organized verticaly
  final bool? isVertical;

  /// Item Builder
  final NullableIndexedWidgetBuilder builder;

  /// Separator Builder
  final IndexedWidgetBuilder? separatorBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: separatorBuilder ??
          (context, index) {
            return const Divider(color: Colors.transparent);
          },
      physics: const BouncingScrollPhysics(),
      itemCount: length,
      padding: EdgeInsets.zero,
      scrollDirection: isVertical == null
          ? Axis.vertical
          : isVertical!
              ? Axis.vertical
              : Axis.horizontal,
      itemBuilder: builder,
    );
  }
}
