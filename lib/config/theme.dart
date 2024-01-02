import 'package:flutter/material.dart';

ThemeData themes() {
  return ThemeData(
    //primarySwatch: Colors.deepPurple,
    primaryColor: Colors.deepPurple,
    primaryColorDark: const Color(0xFF300251),
    primaryColorLight: const Color(0xFF7B2AB5),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFF5F5F5),

    fontFamily: 'Cabin',
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 36
      ),
      displayMedium: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 24
      ),
      displaySmall: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),
      headlineMedium: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 16
      ),
      headlineSmall: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 14
      ),
      bodyLarge: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 13
      ),
      bodyMedium: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 12
      ),
    ),
  );
}

