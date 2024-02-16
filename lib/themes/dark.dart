import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  textTheme: const TextTheme(
      displayLarge: TextStyle(fontFamily: "Nothing", color: Colors.white),
      bodyLarge: TextStyle(fontFamily: "Nothing", color: Colors.white),
      bodyMedium: TextStyle(fontFamily: "Nothing", color: Colors.white),
      bodySmall: TextStyle(fontFamily: "Nothing", color: Colors.white),
      displayMedium: TextStyle(fontFamily: "Nothing", color: Colors.white),
      displaySmall: TextStyle(fontFamily: "Nothing", color: Colors.white),
      headlineLarge: TextStyle(fontFamily: "Nothing", color: Colors.white),
      headlineMedium: TextStyle(fontFamily: "Nothing", color: Colors.white),
      headlineSmall: TextStyle(fontFamily: "Nothing", color: Colors.white),
      labelLarge: TextStyle(fontFamily: "Nothing", color: Colors.white),
      labelMedium: TextStyle(fontFamily: "Nothing", color: Colors.white),
      labelSmall: TextStyle(fontFamily: "Nothing", color: Colors.white),
      titleLarge: TextStyle(fontFamily: "Nothing", color: Colors.white),
      titleMedium: TextStyle(fontFamily: "Nothing", color: Colors.white),
      titleSmall: TextStyle(fontFamily: "Nothing", color: Colors.white)),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
    return Colors.white;
  }))),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.grey.shade900,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300),
);
