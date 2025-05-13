import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(

      scaffoldBackgroundColor: AppColor.whiteBgColor,
      cardColor: AppColor.whiteBgColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColor.whiteColor,
          unselectedItemColor: AppColor.whiteColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryLight,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: AppColor.whiteColor, width: 5))),
      primaryColor: AppColor.primaryLight,
      useMaterial3: true,
      textTheme: TextTheme(
          headlineLarge: AppStylse.bold20Black,
          headlineMedium: AppStylse.bold20Black));
  static final ThemeData darkTheme = ThemeData(
      cardColor: AppColor.PrimaryDark,
      primaryColor: AppColor.PrimaryDark,
      scaffoldBackgroundColor: AppColor.PrimaryDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColor.whiteColor,
          unselectedItemColor: AppColor.whiteColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryLight,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: AppColor.whiteColor, width: 5))),
      useMaterial3: true,
      textTheme: TextTheme(
          headlineMedium: AppStylse.bold20Black,
          headlineLarge: AppStylse.bold20White));
}
