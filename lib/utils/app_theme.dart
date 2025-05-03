import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
          headlineLarge: AppStylse.bold20Black,
          headlineMedium: AppStylse.bold20Black));
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.PrimaryDark,
      useMaterial3: true,
      textTheme: TextTheme(
          headlineMedium: AppStylse.bold20Black,
          headlineLarge: AppStylse.bold20White));
}
