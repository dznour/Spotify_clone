import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: AppColors.kLightBGColor,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noOverlay,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(30),
      hintStyle: const TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.white, width: 0.4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black, width: 0.4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.kPrimaryColor, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: AppColors.kDarkBGColor,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noOverlay,
      activeTrackColor: const Color(0xffB7B7B7),
      inactiveTrackColor: Colors.grey.withOpacity(0.3),
      thumbColor: const Color(0xffB7B7B7),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.white, width: 0.4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.white, width: 0.4),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              const BorderSide(color: AppColors.kPrimaryColor, width: 1)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}
