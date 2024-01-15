import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  textTheme: const TextTheme(bodyLarge: TextStyle(fontFamily: "Nothing")),
  switchTheme: SwitchThemeData(
    trackColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      return Colors.white;
    }),
    thumbColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      return Colors.black;
    }),
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.white),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.grey.shade900,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300),
);
