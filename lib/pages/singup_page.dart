import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tecgram_app/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var roles = ['Estudiante', 'Profesor', 'Departamento'];
  var carreras = ['Ingeniería en sistemas computacionales', 'Ingeniería en gestión empresarial', 'Ingeniería industrial', 'Ingeniería electrónica', 'Ingenierpia mecatrónica', 'Contador público', 'Maestría administrativa'];

  String rol = 'Estudiante';
  String carrera = 'Ingeniería en sistemas computacionales';
  var tabController;

  final _form = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerNombre = TextEditingController();
  final controllerApellidos = TextEditingController();
  final controllerArea = TextEditingController();

  bool esAlumno = false;

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                const Text("Registrarse como:"),
                DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: roles.map((e) => DropdownMenuItem(child: Row(children: [Icon(iconRol(e)), SizedBox(width: 10,), Text(e)],), value: e,)).toList(),
                  value: rol,
                  onChanged: (String? value) => cambiarRol(value),
                )
              ],),
              Text("Tus datos"),
              crearCampo(etiqueta: "Nombre(s)", context: context, controller: controllerNombre),
              crearCampo(etiqueta: "Apellidos", context: context, controller: controllerApellidos),
              Text("Datos de acceso"),
              crearCampo(etiqueta: "Correo institucional", context: context, controller: controllerEmail),
              crearCampo(etiqueta: "Contraseña para TecGram", ocultable: true, context: context, controller: controllerPassword),
              (esAlumno ?
              DropdownButton(
                icon: const Icon(Icons.keyboard_arrow_down),
                items: carreras.map((e) => DropdownMenuItem(child: Row(children: [Icon(iconRol(e)), SizedBox(width: 10,), Text(e)],), value: e,)).toList(),
                value: carrera,
                onChanged: (String? value) {
                  setState(() {
                    carrera = value!;
                  });
                },
              ) : Text("DEP")
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData iconRol(String rol){
    switch(rol){
      case 'Estudiante':
        return Icons.face;
      case 'Profesor':
        return Icons.business_center;
      case 'Departamento':
        return Icons.apartment;
    }
    return Icons.info;
  }

  void cambiarRol(String? value){
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

  Widget campoEstudiante(BuildContext context){
    return Row(children: [
      Text("Departamento"),
    ],);
  }
}
