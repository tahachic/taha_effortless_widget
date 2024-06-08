import 'package:flutter/material.dart';

class TRichText extends StatelessWidget {
  const TRichText(
    this.firstText,
    this.secondText, {
    super.key,
    this.maxLines,
    this.overFlow,
    this.textDirection,
    this.firstTextColor,
    this.firstTextSize,
    this.firstTextWeight,
    this.secondTextColor,
    this.secondTextSize,
    this.secondTextWeight,
    this.fontFamily,
    this.textAlign,
  });

  /// The maximum number of lines before overflowing
  final int? maxLines;

  /// The type of Overflow
  final TextOverflow? overFlow;

  /// The Text Direction
  final TextDirection? textDirection;

  /// The first Text
  final String firstText;

  /// The second Text
  final String secondText;

  /// The first Text color
  final Color? firstTextColor;

  /// The first Text size
  final double? firstTextSize;

  /// The first Text weight
  final FontWeight? firstTextWeight;

  /// The second Text
  final Color? secondTextColor;

  /// The second Text size
  final double? secondTextSize;

  /// The second Text weight
  final FontWeight? secondTextWeight;

  /// font family
  final String? fontFamily;

  /// The Text alignment
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines ?? 1,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overFlow ?? TextOverflow.ellipsis,
      textDirection: textDirection ?? TextDirection.ltr,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$firstText ',
            style: TextStyle(
              color: firstTextColor ?? Colors.black,
              fontWeight: firstTextWeight,
              fontSize: firstTextSize,
              fontFamily:
                  fontFamily ?? DefaultTextStyle.of(context).style.fontFamily,
            ),
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
              color: secondTextColor ?? Colors.black,
              fontSize: secondTextSize,
              fontWeight: secondTextWeight,
              fontFamily:
                  fontFamily ?? DefaultTextStyle.of(context).style.fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
