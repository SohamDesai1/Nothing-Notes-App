import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'models/note_db.dart';
import 'providers/theme.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDB.initialize();
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return Consumer(
          builder: (context, ref, child) {
            final theme = ref.watch(themerProvider);
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: theme.theme,
              routeInformationParser: Routes.router.routeInformationParser,
              routeInformationProvider: Routes.router.routeInformationProvider,
              routerDelegate: Routes.router.routerDelegate,
            );
          },
        );
      },
    );
  }
}
