import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:n_notes_app/screens/new_note.dart';
import '../screens/home.dart';
import '../screens/edit_note.dart';

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
        GoRoute(
          path: '/new',
          name: "New",
          builder: (context, state) => NewNote(key: state.pageKey),
        ),
        GoRoute(
          path: '/edit',
          name: "Edit",
          builder: (context, state) {
            return EditNote(
              key: state.pageKey,
              title: state.pathParameters['title']!,
              text: state.pathParameters['text']!,
              noteKey: state.pathParameters['key']!,
            );
          },
        ),
      ]);
}
