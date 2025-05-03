import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = 'en';

  void changeLanguage(String newLang) {
    if (currentLanguage == newLang) {
      return;
    }
    currentLanguage = newLang;
    notifyListeners();
  }
}
