import 'package:flutter/material.dart';

class TNotch extends StatelessWidget {
  const TNotch({super.key, this.color, this.width});

  /// Color of the notch default to [Colors.grey.shade300]
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
        height: 5,
        width: width ?? 50,
        decoration: BoxDecoration(
          color: color ?? Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
