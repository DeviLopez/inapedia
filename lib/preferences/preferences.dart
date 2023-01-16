import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/controllerData.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _nom = '';
  static String _contrasena = '';
  static int _genere = 1;
  static bool _isDarkMode = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get nom {
    return _prefs.getString('nom') ?? _nom;
  }

  static set nom(String value) {
    _nom = value;
    _prefs.setString('nom', value);
  }

  static String get contrasena {
    return _prefs.getString('pass') ?? _contrasena;
  }

  static set contrasena(String value) {
    _contrasena = value;
    _prefs.setString('pass', value);
  }

  static int get genere {
    return _prefs.getInt('gen') ?? _genere;
  }

  static set genere(int value) {
    _genere = value;
    _prefs.setInt('gen', value);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }
}
