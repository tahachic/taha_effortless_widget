import 'package:flutter/material.dart';

class TText extends StatelessWidget {
  const TText(
    this.text, {
    super.key,
    this.maxLines,
    this.textDirection,
    this.overFlowType,
    this.alignment,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.textWeight,
    this.maxWidth,
    this.withShadow = false,
  });

  /// The Text to be displayed
  final String text;

  /// Max lines before overflowing
  final int? maxLines;

  /// The TextOverflow default to ellipsis
  final TextOverflow? overFlowType;

  /// The Text Alignment default to Center
  final TextAlign? alignment;

  /// The Text Color default to Black
  final Color? color;

  /// The Text FontFamily default to Application Theme
  final String? fontFamily;

  /// The Text FontSize default 18.0
  final double? fontSize;

  /// The TextWeight [Bold,Normal,...] default to normal
  final FontWeight? textWeight;

  /// The TextDirection [rtl,Ltr,...] default to ltr
  final TextDirection? textDirection;

  /// max Text Width to return to line
  final double? maxWidth;

  /// add shadow behind Text
  final bool? withShadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Text(
        text,
        maxLines: maxLines ?? 2,
        overflow: overFlowType ?? TextOverflow.fade,
        textAlign: alignment ?? TextAlign.start,
        textDirection: textDirection,
        style: TextStyle(
          color: color ?? Colors.black,
          shadows: withShadow!
              ? [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 2,
                    offset: Offset(3, 0),
                  ),
                ]
              : [],
          fontFamily:
              fontFamily ?? DefaultTextStyle.of(context).style.fontFamily,
          fontSize: fontSize ?? 18,
          fontWeight: textWeight ?? FontWeight.w300,
        ),
      ),
    );
  }
}
