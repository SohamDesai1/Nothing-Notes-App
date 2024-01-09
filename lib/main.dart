import 'package:flutter/material.dart';
import 'package:n_notes_app/routes/routes.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black, foregroundColor: Colors.white),
            scaffoldBackgroundColor: Colors.black,
            textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Nothing"),
          ),
          routeInformationParser: Routes.router.routeInformationParser,
          routeInformationProvider: Routes.router.routeInformationProvider,
          routerDelegate: Routes.router.routerDelegate,
        );
      },
    );
  }
}
