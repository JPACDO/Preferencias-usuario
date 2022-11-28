import 'package:flutter/material.dart';

import 'package:preferencias_usuarios_app/src/pages/home_page.dart';
import 'package:preferencias_usuarios_app/src/pages/setting_page.dart';
import 'package:preferencias_usuarios_app/src/share_prefs/preferecias_usuario.dart';

void main() async {
  final prefs = Preferenciasusuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = Preferenciasusuario();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PREFERENCIAS',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routename: (context) => HomePage(),
        SettingPage.routename: (context) => const SettingPage(),
      },
    );
  }
}
