import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontFamily: "Nothing", color: Colors.black),
    bodyLarge: TextStyle(fontFamily: "Nothing", color: Colors.black),
    bodyMedium: TextStyle(fontFamily: "Nothing", color: Colors.black),
    bodySmall: TextStyle(fontFamily: "Nothing", color: Colors.black),
    displayMedium: TextStyle(fontFamily: "Nothing", color: Colors.black),
    displaySmall: TextStyle(fontFamily: "Nothing", color: Colors.black),
    headlineLarge: TextStyle(fontFamily: "Nothing", color: Colors.black),
    headlineMedium: TextStyle(fontFamily: "Nothing", color: Colors.black),
    headlineSmall: TextStyle(fontFamily: "Nothing", color: Colors.black),
    labelLarge: TextStyle(fontFamily: "Nothing", color: Colors.black),
    labelMedium: TextStyle(fontFamily: "Nothing", color: Colors.black),
    labelSmall: TextStyle(fontFamily: "Nothing", color: Colors.black),
    titleLarge: TextStyle(fontFamily: "Nothing", color: Colors.black),
    titleMedium: TextStyle(fontFamily: "Nothing", color: Colors.black),
    titleSmall: TextStyle(fontFamily: "Nothing", color: Colors.black),
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.black),
  switchTheme: SwitchThemeData(
    trackOutlineColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      return Colors.black;
    }),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
    return Colors.black;
  }))),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.grey.shade100,
      secondary: Colors.grey.shade300,
      inversePrimary: Colors.grey.shade700),
);
