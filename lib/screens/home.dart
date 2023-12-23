import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        // backgroundColor: Colors.black,
        title: const Text("NOTES", style: TextStyle(fontSize: 45)),
      ),
      body: const Center(
        child: Text(
          '',
          style: TextStyle(fontSize: 75),
        ),
      ),
    );
  }
}
