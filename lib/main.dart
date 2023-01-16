import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inapedia/pages/configPage.dart';
import 'package:inapedia/pages/loginPage.dart';
import 'package:inapedia/preferences/preferences.dart';

import 'controller/controllerData.dart';
import 'pages/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Preferences.isDarkMode ? ThemeData.dark() : _lightTheme,
      darkTheme: _darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute:
          'login', //aplicamos unas rutas para desplazarnos por la aplicacion
      routes: {
        'home': (context) =>
            HomePage(), //la ruta inicial es para la home_page y desde esta nos desplazamos a las otras paginas
        'login': (context) => LoginScreen(),
        'config': (context) => SettingsScreen(),
      },
    );
  }
}
