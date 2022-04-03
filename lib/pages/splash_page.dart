import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecgram_app/session/session.dart';

/// Widget por defecto al abrir la aplicación
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Al iniciar el Widget, verificar por una sesión

    CheckSession();
  }

  /// Verificar si existe una sesión
  void CheckSession() async {
    final _session = Session();
    final _data = await _session.get();

    // Si la sesión es nula (no existe)
    if (_data == null) {
      // Navegar a la ruta Login

      Navigator.pushReplacementNamed(context, 'login');

      // Y retornar
      return;
    }

    // Si no se cumplió la condición, se navega a la ruta de Home
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, 'main', arguments: _data);
  }

  /// La vista del widget solo mostrará un simbolo de carga
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 11, 41, 85),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Center(
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                  ),
                  Text(
                    "Tecgram",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          CupertinoActivityIndicator(
            radius: 20,
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
