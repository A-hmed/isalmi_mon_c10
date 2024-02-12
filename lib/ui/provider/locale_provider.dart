import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  String currentLocale = "en";

  void setNewLocale(String newLocale){
    currentLocale = newLocale;
    print("notifyListeners");
    notifyListeners();
  }
}