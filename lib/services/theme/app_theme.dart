import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static get _textTheme => TextTheme(
    // Headlines
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      fontFamily: GoogleFonts.belleza().fontFamily,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      fontFamily: GoogleFonts.belleza().fontFamily,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),

    // Titles
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),

    // Body text
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: GoogleFonts.alegreya().fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Colors.grey,
    ),

    // Labels
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.poppins().fontFamily,
    ),
  );

  static get _progressIndicatorTheme =>
  // ignore: deprecated_member_use
  ProgressIndicatorThemeData(year2023: false);

  get lightTheme => ThemeData(
    appBarTheme: AppBarTheme(elevation: 0, color: Colors.white),
    primaryColor: const Color(0xFFF5B400),
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: Color(0xFFF9E8DD),
    iconTheme: IconThemeData(color: Color(0xFFF4722B)),
    fontFamily: GoogleFonts.montserrat().fontFamily,
    textTheme: _textTheme,
    canvasColor: Color.fromARGB(255, 243, 237, 232),
    dividerColor: Color.fromARGB(255, 201, 143, 111),
    progressIndicatorTheme: _progressIndicatorTheme,
  );

  get darkTheme => ThemeData(
    appBarTheme: AppBarTheme(elevation: 0, color: Colors.black),
    primaryColor: Colors.deepPurple,
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    textTheme: _textTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
  );
}
