import 'package:flutter/material.dart';
import 'package:songgpt/core/theme/pallete.dart';

class AppTheme {
  static _border([Color color = Pallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
      );

  static final darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: Colors.white, // Primary color for dark theme
      onPrimary: Colors.black, // Button text color
      surface: Colors.black, // Background color for text fields
      outline: Colors.white54, // Border color for enabled state
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(Colors.white54),
      focusedBorder: _border(Colors.white),
    ),
  );

  static final lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.black, // Primary color for light theme
      onPrimary: Colors.white, // Button text color
      surface: Colors.white, // Background color for text fields
      outline: Colors.black54, // Border color for enabled state
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(Colors.black54),
      focusedBorder: _border(Colors.black),
    ),
  );
}
