import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primaryColor: const Color(0xff512DA8),
      textTheme:
          GoogleFonts.robotoTextTheme(Theme.of(context).textTheme).copyWith(
        titleLarge: TextStyle(
          // This is the default style for AppBar titles
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        // Add more text styles as needed
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple, // Define your primarySwatch
      ).copyWith(secondary: const Color(0xFFFFA500)),
      // Define other theme properties such as appBarTheme, buttonTheme, etc.
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
        // Define dark theme properties here
        );
  }
}
