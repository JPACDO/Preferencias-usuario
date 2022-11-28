import 'package:preferencias_usuarios_app/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferenciasusuario {
  static final Preferenciasusuario _instancia = Preferenciasusuario._internal();

  factory Preferenciasusuario() {
    return _instancia;
  }

  Preferenciasusuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

//    bool _colorSecundario;
//    int _genero;
//    String _nombre;

  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  String get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  String get ultimaPagina {
    return _prefs.getString('nombreUsuario') ?? HomePage.routename;
  }

  set ultimaPagina(String value) {
    _prefs.setString('nombreUsuario', value);
  }
}
