import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        toolbarHeight: 10.h,
        // backgroundColor: Colors.black,
        title: Text("NOTES", style: TextStyle(fontSize: 7.h)),
      ),
      body: Center(
        child: Text(
          '',
          style: TextStyle(fontSize: 10.h),
        ),
      ),
    );
  }
}
