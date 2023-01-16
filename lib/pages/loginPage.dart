import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllerData.dart';
import '../preferences/preferences.dart';
import '../widgets/sideMenu.dart';
import 'homePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginScreen> {
  final Controller c = Get.put(Controller(isDarkMode: Preferences.isDarkMode));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 136, 30),
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/icono.png')),
              ),
            ),
            Text('Nombre'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '${Preferences.nom}',
                    hintText: 'Introduce un nombre valido'),
                onChanged: (value) {
                  Preferences.nom = value;
                },
              ),
            ),
            Text('Contraseña'),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '${Preferences.contrasena}',
                    hintText: 'Introduce una contraseña segura'),
                onChanged: (value) {
                  Preferences.contrasena = value;
                },
              ),
            ),
            Divider(),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  c.name.value = Preferences.nom;
                  c.pass.value = Preferences.contrasena;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
