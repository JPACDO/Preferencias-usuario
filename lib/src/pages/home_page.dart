import 'package:flutter/material.dart';
import 'package:preferencias_usuarios_app/src/share_prefs/preferecias_usuario.dart';
import 'package:preferencias_usuarios_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static const String routename = 'home';
  final prefs = Preferenciasusuario();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routename;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prefrencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario : ${prefs.colorSecundario}'),
          const Divider(),
          Text('Genero : ${prefs.genero}'),
          const Divider(),
          Text('Nombre usuario : ${prefs.nombreUsuario}'),
          const Divider(),
        ],
      ),
    );
  }
}
