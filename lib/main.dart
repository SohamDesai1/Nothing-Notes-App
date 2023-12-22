import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          focusColor: const Color.fromARGB(255, 255, 255, 255)),
      home: const Scaffold(
        body: Center(
          child: Text(
            'N-NOTES',
            style: TextStyle(fontFamily: "Nothing", fontSize: 26),
          ),
        ),
      ),
    );
  }
}
