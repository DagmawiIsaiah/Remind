import 'package:flutter/material.dart';

TextStyle baseTextStyle = const TextStyle(
  fontFamily: "Inter",
  fontWeight: FontWeight.normal,
  color: Color.fromARGB(255, 52, 52, 52),
);

class AppTheme {
  static TextTheme appTextTheme = TextTheme(
    titleLarge: baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color.fromARGB(255, 52, 52, 52).withOpacity(0.8),
    ),
    bodyLarge: baseTextStyle.copyWith(
      fontSize: 14,
    ),
    bodyMedium: baseTextStyle.copyWith(
      fontSize: 12,
    ),
    bodySmall: baseTextStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
  );

  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    textTheme: appTextTheme,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.black.withOpacity(0.6),
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white.withOpacity(0.6),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    ),
  );
}
