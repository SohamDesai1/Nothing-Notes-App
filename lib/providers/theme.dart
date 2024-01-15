import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../themes/light.dart';
import '../themes/dark.dart';

final themerProvider = ChangeNotifierProvider<Themer>((ref) {
  return Themer();
});

class Themer extends ChangeNotifier {
  ThemeData _theme = darkmode;
  ThemeData get theme => _theme;

  bool get dark => _theme == lightmode;

  set themeData(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }

  toggleTheme() {
    if (_theme == darkmode) {
      themeData = lightmode;
    } else {
      themeData = darkmode;
    }
  }
}
