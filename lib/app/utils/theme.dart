import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.whiteColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.whiteColor
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColor.inputFilledColor,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none
    )
  );
}
