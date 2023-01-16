import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllerData.dart';
import '../preferences/preferences.dart';
import '../widgets/sideMenu.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'config';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Configuració',
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                const Divider(),
                SwitchListTile(
                    value: Preferences.isDarkMode,
                    title: const Text('Dark Mode'),
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      if (!Preferences.isDarkMode)
                        c.setLight();
                      else
                        c.setDark();
                      c.switchTheme();
                      print(Preferences.isDarkMode);
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.genere,
                    title: const Text('Masculino'),
                    onChanged: (value) {
                      Preferences.genere = value ?? 1;
                      c.genere.value = Preferences.genere;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.genere,
                    title: const Text('Femenino'),
                    onChanged: (value) {
                      Preferences.genere = value ?? 1;
                      c.genere.value = Preferences.genere;
                      setState(() {});
                    }),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
