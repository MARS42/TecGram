import 'package:flutter/material.dart';
import 'package:tecgram_app/pages/home_page.dart';
import 'package:tecgram_app/pages/login_page.dart';
import 'package:tecgram_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

/// Widget root de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),

      //Pantalla por defecto al abrir la aplicación
      home: SplashPage(),

      //Rutas desde esta pantalla
      routes: {
        //Ruta a la vista de login
        'login': (BuildContext context) => LoginPage(),

        //Ruta a la vista de home
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
