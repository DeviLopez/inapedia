import 'package:flutter/material.dart';
import 'package:fluttering_phrases/fluttering_phrases.dart';
import 'package:get/get.dart';
import '../controller/controllerData.dart';
import '../preferences/preferences.dart';
import '../widgets/sideMenu.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const attributives = [
    'increible',
    'fantastico',
    'desagradable',
    ...defaultAttributives
  ];
  static const nouns = ['ejemplo', 'pokemon', ...defaultNouns];
  var generatedTitle;
  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${Preferences.nom}'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/icono.png'),
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Divider(),
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() => Text("${c.frase}"))),
            ),
            Divider(),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  onPressed: () {
                    generatedTitle = generate(
                        delimiter: generate(),
                        tokenRadix: 3,
                        attributives: attributives,
                        nouns: nouns);
                    c.frase.value = generatedTitle;
                    print(generatedTitle);
                    print(c.frase);
                  },
                  child: Text(
                    'Generar frase',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Modo oscuro: ${Preferences.isDarkMode}'),
                Text('Genero: ${Preferences.genere}'),
                Text(
                    'Usuario: ${Preferences.nom + ' ' + Preferences.contrasena}'),
              ],
            ),
          ],
        ));
  }
}
