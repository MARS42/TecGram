import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecgram_app/pages/main_page.dart';
import 'package:tecgram_app/pages/login_page.dart';
import 'package:tecgram_app/pages/splash_page.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
      home: const SplashPage(),

      //Rutas desde esta pantalla
      routes: {
        //Ruta a la vista de login
        'login': (BuildContext context) => const LoginPage(),

        //Ruta a la vista de home
        'main': (BuildContext context) => const MainPage(),
      },
    );
  }
}
