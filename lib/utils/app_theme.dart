import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.blue;
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color redColor = Colors.red;
  static const Color greyColor = Colors.grey;

  static ThemeData buildTheme() {
    final baseData = ThemeData.light();
    final textTheme = baseData.textTheme;
    final dividerTheme =
        baseData.dividerTheme.copyWith(color: blackColor, thickness: 1);

    return baseData.copyWith(
      primaryColor: primaryColor,
      dividerTheme: dividerTheme,
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme,
    );
  }
}
