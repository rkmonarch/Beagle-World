import 'package:flutter/material.dart';
import 'package:Beagle_Community/components/screens/screens.dart';

class ScreenProvider extends ChangeNotifier {
  Screens _currentScreen = Screens.home;

  Screens get currentScreen => _currentScreen;

  void changeScreen(Screens screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
