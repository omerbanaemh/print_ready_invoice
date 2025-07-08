// lib/providers/locale_provider.dart
import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void toggleLocale() {
    _locale = _locale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    notifyListeners();
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}