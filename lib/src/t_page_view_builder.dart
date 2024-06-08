import 'package:flutter/material.dart';

class TPageViewBuilder extends StatelessWidget {
  const TPageViewBuilder({
    super.key,
    required this.pageController,
    this.scrollDirection = Axis.horizontal,
    required this.itemBuilder,
    required this.itemCount,
    this.onPageChanged,
    this.physics,
    this.allowImplicitScrolling = false,
  });

  /// PageView Controller
  final PageController pageController;

  /// Item Builder
  final Widget? Function(BuildContext, int) itemBuilder;

  /// Scroll Direction default to [Axis.vertical]
  final Axis scrollDirection;

  /// onPageChanged
  final ValueChanged<int>? onPageChanged;

  /// Pages count
  final int itemCount;

  /// AllowImplicitScrolling
  final bool? allowImplicitScrolling;

  /// ScrollPhysics default to [BouncingScrollPhysics]
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: physics ?? const BouncingScrollPhysics(),
      itemBuilder: itemBuilder,
      allowImplicitScrolling: allowImplicitScrolling!,
      scrollDirection: scrollDirection,
      onPageChanged: onPageChanged,
      controller: pageController,
      itemCount: itemCount,
    );
  }
}
