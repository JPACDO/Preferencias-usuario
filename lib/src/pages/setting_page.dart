import 'package:flutter/material.dart';
import 'package:preferencias_usuarios_app/src/share_prefs/preferecias_usuario.dart';

// import 'package:shared_preferences/shared_preferences.dart';

import 'package:preferencias_usuarios_app/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {
  static const String routename = 'settings';

  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late bool _colorSecundario;
  int? _genero;
  // late String _nombre;

  TextEditingController _textXontroller = TextEditingController();

  final prefs = Preferenciasusuario();

  @override
  void initState() {
    super.initState();
    // cargarPref();
    prefs.ultimaPagina = SettingPage.routename;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textXontroller = TextEditingController(text: prefs.nombreUsuario);
  }

  // cargarPref() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   _genero = prefs.getInt('genero');
  //   setState(() {});
  // }

  void _setSelectedradio(int? valor) {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('genero', valor!);
    prefs.genero = valor!;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: const Text('Color secundario'),
            onChanged: ((value) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            }),
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            title: const Text('Masculisno'),
            onChanged: _setSelectedradio,
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            title: const Text('Femenino'),
            onChanged: _setSelectedradio,
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textXontroller,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el relefono',
              ),
              onChanged: ((value) {
                prefs.nombreUsuario = value;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
