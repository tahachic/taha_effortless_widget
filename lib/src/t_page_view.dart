import 'package:flutter/material.dart';

class TPageView extends StatelessWidget {
  const TPageView({
    super.key,
    required this.pageController,
    required this.scrollDirection,
    required this.pages,
    this.onPageChanged,
    this.physics,
    this.allowImplicitScrolling = true,
  });

  /// PageController
  final PageController pageController;

  /// ScrollDirection default to [Axis.vertical]
  final Axis scrollDirection;

  /// List of pages
  final List<Widget> pages;

  /// onPageChanged
  final ValueChanged<int>? onPageChanged;

  /// ScrollPhysics
  final ScrollPhysics? physics;

  /// AllowImplicitScrolling
  final bool? allowImplicitScrolling;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: physics,
      allowImplicitScrolling: allowImplicitScrolling!,
      scrollDirection: scrollDirection,
      onPageChanged: onPageChanged,
      controller: pageController,
      children: pages,
    );
  }
}
