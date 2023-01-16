import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inapedia/preferences/preferences.dart';

class Controller extends GetxController {
  var name = ''.obs;
  var pass = ''.obs;
  var genere = 1.obs;
  var frase = ''.obs;

  ThemeData currentTheme;

  void switchTheme() {
    Get.changeThemeMode(
        Preferences.isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  Controller({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLight() {
    currentTheme = ThemeData.light();
  }

  setDark() {
    currentTheme = ThemeData.dark();
  }
}
