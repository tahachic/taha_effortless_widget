import 'package:flutter/material.dart';

class TVisibility extends StatelessWidget {
  const TVisibility({
    super.key,
    required this.condition,
    required this.child,
    required this.replacement,
  });

  /// The Condition Switches between showing the [child] or hiding it.
  final bool condition;

  /// The Widget to be showing if [condition] is true
  final Widget child;

  /// The Widget to be showing if [condition] is false
  final Widget replacement;

  @override
  Widget build(BuildContext context) {
    return condition ? child : replacement;
  }
}
