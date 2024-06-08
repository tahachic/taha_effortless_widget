import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 't_container.dart';
import 't_rich_text.dart';

class TTextFormField extends StatelessWidget {
  const TTextFormField({
    super.key,
    required this.controller,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.margin,
    this.radius,
    this.hint,
    this.hintMaxLines,
    this.hintColor,
    this.title,
    this.titleColor,
    this.titleSize,
    this.titleWeight,
    this.suffix,
    this.prefix,
    this.autofocus,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.borderWidth,
    this.borderColor,
    this.validator,
    this.withShadow = false,
    this.isRequired = false,
    this.dismissKeyboard = true,
    this.maxLength,
    this.maxLines,
    this.textInputAction,
  });

  /// Text Editing Controller
  final TextEditingController controller;

  /// Form Validator
  final String? Function(String? value)? validator;

  /// height
  final double? height;

  /// Width
  final double? width;

  /// backgroung Color default to [Colors.grey.shade200]
  final Color? color;

  /// Padding
  final double? padding;

  /// Marging
  final double? margin;

  /// radius
  final double? radius;

  /// Text hint
  final String? hint;

  /// Text Hint color
  final Color? hintColor;

  /// Form Field Title
  final String? title;

  /// Color of Form Field Title
  final Color? titleColor;

  /// FontSize of the title default to 20.sp
  final double? titleSize;

  /// FontWeight of the title default to [FontWeight.w300]
  final FontWeight? titleWeight;

  /// the widget befor the form field
  final Widget? suffix;

  /// the widget after the form field
  final Widget? prefix;

  /// autofocus default to [false]
  final bool? autofocus;

  /// keyboardType default to [TextInputType.text]
  final TextInputType? keyboardType;

  /// obscureText default to [false]
  final bool? obscureText;

  /// onChanged callback
  final Function(String)? onChanged;

  /// onFieldSubmitted callback
  final Function(String)? onFieldSubmitted;

  /// onEditingComplete callback
  final Function()? onEditingComplete;

  /// borderWidth
  final double? borderWidth;

  /// borderColor
  final Color? borderColor;

  /// add shadow
  final bool? withShadow;

  /// is this form field requied
  final bool? isRequired;

  /// dissmiss keyboard when outside click
  final bool? dismissKeyboard;

  /// The maximum number of lines the [hintText] can occupy.
  final int? hintMaxLines;

  /// FormField Max length , number of letters
  final int? maxLength;

  /// FormField maxlines
  final int? maxLines;

  /// Text input Action default to [TextInputAction.done]
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: title == null ? null : const EdgeInsets.only(top: 20),
          child: TContainer(
            radius: radius ?? 10,
            height: height,
            alignment: Alignment.topLeft,
            width: width,
            shadow: withShadow!
                ? [
                    BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 2,
                      color: Colors.black.withOpacity(0.05),
                    )
                  ]
                : null,
            borderWidth: borderWidth,
            borderColor: borderColor != null
                ? color!.withOpacity(0.5)
                : borderWidth == null
                    ? null
                    : Colors.grey.withOpacity(0.5),
            color: color ?? Colors.grey.shade200,
            padding: EdgeInsets.symmetric(horizontal: padding ?? 25),
            margin: EdgeInsets.symmetric(horizontal: margin ?? 15),
            child: TextFormField(
              validator: validator,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              onFieldSubmitted: onFieldSubmitted,
              textInputAction: textInputAction ?? TextInputAction.done,
              onTapOutside: !dismissKeyboard!
                  ? null
                  : (event) {
                      hideKeyboard(context);
                    },
              textDirection: keyboardType == TextInputType.number ||
                      keyboardType == TextInputType.phone
                  ? TextDirection.ltr
                  : detectLanguage(hint ?? title ?? controller.text) == 'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
              cursorColor: titleColor ?? Colors.black54,
              cursorWidth: 2,
              controller: controller,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLength: maxLength,
              maxLines: maxLines ?? 1,
              autofocus: autofocus ?? false,
              obscureText: obscureText ?? false,
              keyboardType: keyboardType,
              style: TextStyle(
                  color: titleColor, fontWeight: FontWeight.w300, fontSize: 20),
              decoration: InputDecoration(
                hintText: hint ?? title,
                hintTextDirection:
                    detectLanguage(hint ?? title ?? controller.text) == 'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                border: InputBorder.none,
                suffixIcon:
                    detectLanguage(hint ?? title ?? controller.text) == 'ar'
                        ? prefix
                        : suffix,
                prefixIcon:
                    detectLanguage(hint ?? title ?? controller.text) == 'ar'
                        ? suffix
                        : prefix,
                hintMaxLines: hintMaxLines ?? 2,
                hintStyle: TextStyle(
                    fontSize: 18,
                    color: hintColor ??
                        (titleColor != null
                            ? titleColor!.withOpacity(0.2)
                            : Colors.grey)),
              ),
            ),
          ),
        ),
        title != null
            ? Positioned(
                top: 0,
                left: detectLanguage(title ?? 'a') == 'en' ? 30 : null,
                right: detectLanguage(title) == 'ar' ? 30 : null,
                child: TContainer(
                  shadow: withShadow != null
                      ? withShadow!
                          ? [
                              BoxShadow(
                                blurRadius: 4,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.05),
                              )
                            ]
                          : null
                      : null,
                  radius: radius ?? 5,
                  color: color ?? Colors.grey.shade200,
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 280),
                    child: TRichText(
                      title!,
                      isRequired! ? '*' : '',
                      fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                      textDirection: detectLanguage(title ?? 'a') == 'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      firstTextColor: titleColor,
                      secondTextSize: titleSize ?? 20,
                      secondTextColor: Colors.deepOrange,
                      firstTextSize: titleSize ?? 20,
                      textAlign: TextAlign.start,
                      firstTextWeight: titleWeight ?? FontWeight.w300,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  String detectLanguage(String? string) {
    String languageCode = 'en';
    if (string == null) return languageCode;
    final RegExp english = RegExp(r'^[a-zA-Z]+');
    final RegExp arabic = RegExp(r'^[\u0621-\u064A]+');
    if (english.hasMatch(string)) languageCode = 'en';
    if (arabic.hasMatch(string)) languageCode = 'ar';
    return languageCode;
  }
}
