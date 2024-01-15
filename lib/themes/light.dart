import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  textTheme: const TextTheme(displayLarge: TextStyle(fontFamily: "Nothing")),
  switchTheme: SwitchThemeData(
    trackColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      return Colors.black;
    }),
    thumbColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      return Colors.white;
    }),
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.black),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.grey.shade100,
      secondary: Colors.grey.shade300,
      inversePrimary: Colors.grey.shade700),
);
