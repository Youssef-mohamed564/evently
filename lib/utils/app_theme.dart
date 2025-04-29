import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme =
      ThemeData(textTheme: TextTheme(headlineLarge: AppStylse.bold20Black));
  static final ThemeData darkTheme =
      ThemeData(textTheme: TextTheme(headlineLarge: AppStylse.bold20White));
}
