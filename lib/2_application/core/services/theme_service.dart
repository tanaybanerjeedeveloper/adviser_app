import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ThemeService with ChangeNotifier {
  var isDarkModeOn = false;

  void toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }
}
