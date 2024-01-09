import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home.dart';

class Routes {
  static GoRouter router = GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(),
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: "Home",
          builder: (context, state) => Home(key: state.pageKey),
        ),
      ]);
}
