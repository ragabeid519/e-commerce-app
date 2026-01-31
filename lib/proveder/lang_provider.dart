import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  void changeLocale(Locale newLocale) {
    if (newLocale != _currentLocale) {
      _currentLocale = newLocale;
      print(" Locale changed to: $_currentLocale ");
      notifyListeners();
    }
  }
}
