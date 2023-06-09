import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final primaryColor = Colors.deepPurple;
    final primaryColorDark = Colors.deepPurple.shade700;
    final primaryColorLight = Colors.deepPurple.shade300;
    final textColor = primaryColor;
    final accentColor = Colors.deepPurpleAccent;

    final textTheme = TextTheme(
      titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    );

    return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        color: primaryColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          letterSpacing: -0.41,
          fontSize: 18,
          color: textColor,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
    );
  }
}
