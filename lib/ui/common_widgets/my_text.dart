import 'package:flutter/material.dart';
import 'package:insta_downloader/utils/app_theme.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool upperCase;
  final double letterSpacing;
  final TextDecoration? decoration;
  final TextOverflow? overflow;

  const MyText(
    this.text, {
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = AppTheme.blackColor,
    this.textAlign,
    this.maxLines,
    this.upperCase = false,
    this.letterSpacing = 0,
    this.decoration,
    this.overflow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      upperCase ? text.toUpperCase() : text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
  }
}
