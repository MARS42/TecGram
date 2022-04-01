import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tecgram_app/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static const roles = ['Estudiante', 'Profesor', 'Departamento'];
  static const carreras = [
    'Ingeniería en sistemas computacionales',
    'Ingeniería en gestión empresarial',
    'Ingeniería industrial',
    'Ingeniería electrónica',
    'Ingenierpia mecatrónica',
    'Contador público',
    'Maestría administrativa'
  ];
  static const departamentos = [
    'Sistemas',
    'Gestion',
    'Contador',
    'Mecatronica',
    'Industrial',
    'Electronica',
    'Basicas'
  ];

  String rol = 'Estudiante';
  String departamento = 'Sistemas';
  String carrera = 'Ingeniería en sistemas computacionales';
  var tabController;

  final _form = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerNombre = TextEditingController();
  final controllerApellidos = TextEditingController();
  final controllerArea = TextEditingController();
  final controllerSemestre = TextEditingController();

  bool esAlumno = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(child: Text("Registrarse como:")),
                      DropdownButton(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: roles
                            .map((e) => DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Icon(iconRol(e)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(e)
                                    ],
                                  ),
                                  value: e,
                                ))
                            .toList(),
                        value: rol,
                        onChanged: (String? value) => cambiarRol(value),
                      )
                    ],
                  ),
                  Text("Tus datos"),
                  crearCampo(
                      etiqueta: "Nombre(s)",
                      context: context,
                      controller: controllerNombre),
                  crearCampo(
                      etiqueta: "Apellidos",
                      context: context,
                      controller: controllerApellidos),
                  esAlumno ? crearCampo(
                      etiqueta: "Semestre",
                      context: context,
                      controller: controllerSemestre) : const Text(""),
                  Text("Datos de acceso"),
                  crearCampo(
                      etiqueta: "Correo institucional",
                      context: context,
                      controller: controllerEmail),
                  crearCampo(
                      etiqueta: "Contraseña para TecGram",
                      ocultable: true,
                      context: context,
                      controller: controllerPassword),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text(esAlumno ? 'Tu carrera' : 'Tu departamento')),
                      obtenerDropdown(esAlumno ? carreras : departamentos, esAlumno ? carrera : departamento)
                    ],
                  ),
                  Center(child: ElevatedButton(onPressed: () => {}, child: const Text("Registrarse")))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData iconRol(String rol) {
    switch (rol) {
      case 'Estudiante':
        return Icons.face;
      case 'Profesor':
        return Icons.business_center;
      case 'Departamento':
        return Icons.apartment;
    }
    return Icons.info;
  }

  void cambiarRol(String? value) {
    setState(() {
      rol = value!;
      esAlumno = rol == 'Estudiante';
    });
  }

  // DropdownButton selecionarRol(){
  //   return DropdownButton(
  //     icon: const Icon(Icons.keyboard_arrow_down),
  //     items: roles.map((e) => DropdownMenuItem(child: Row(children: [Icon(iconRol(e)), SizedBox(width: 10,), Text(e)],), value: e,)).toList(),
  //     value: rol,
  //     onChanged: (String? value) => cambiarRol(value),
  //   );
  // }

  DropdownButton obtenerDropdown(List<String> lista, String defaultItem) {
    return DropdownButton(
      icon: const Icon(Icons.keyboard_arrow_down),
      items: lista
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      value: defaultItem,
      onChanged: cambiarCarreraDepto,
    );
  }

  void cambiarCarreraDepto(dynamic valor) {
    setState(() {
      if (esAlumno) {
        carrera = valor.toString();
      } else {
        departamento = valor.toString();
      }
    });
  }
}
