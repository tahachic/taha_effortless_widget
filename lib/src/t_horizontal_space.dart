import 'package:flutter/material.dart';

class THorizontalSpace extends StatelessWidget {
  const THorizontalSpace(this.space, {super.key});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
