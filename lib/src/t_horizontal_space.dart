import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.space, {super.key});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
