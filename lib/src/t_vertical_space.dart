import 'package:flutter/material.dart';

class TVerticalSpace extends StatelessWidget {
  const TVerticalSpace(this.space, {super.key});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
