import "package:flutter/material.dart";

class MyElevatedButtonTheme {
  MyElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      elevation: 0,
      backgroundColor:
          const Color(0xFFDB3022), // Keep the same color for dark theme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      elevation: 0,
      backgroundColor:
          const Color(0xFFDB3022), // Keep the same color for dark theme
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  );
}
