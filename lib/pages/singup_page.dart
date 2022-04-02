import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tecgram_app/api/auth.dart';
import 'package:tecgram_app/pages/login_page.dart';
import 'package:tecgram_app/pages/widgets/campoTexto.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static const roles = ['Estudiante', 'Profesor', 'Departamento'];
  static const Map<String, String> rolesKey = {
    'Estudiante': 'student',
    'Profesor': 'teacher',
    'Departamento': 'office'
  };

  static const carreras = [
    'Ingeniería en sistemas computacionales',
    'Ingeniería en gestión empresarial',
    'Ingeniería industrial',
    'Ingeniería electrónica',
    'Ingenierpia mecatrónica',
    'Contador público',
    'Maestría administrativa'
  ];

  static const Map<String, String> careersKey = {
    'Ingeniería en sistemas computacionales': 'ISC',
    'Ingeniería en gestión empresarial': 'IGE',
    'Ingeniería industrial': 'II',
    'Ingeniería electrónica': 'IE',
    'Ingenierpia mecatrónica': 'IM',
    'Contador público': 'CP',
    'Maestría administrativa': 'MA'
  };

  static const departamentos = [
    'Sistemas',
    'Gestion',
    'Contador',
    'Mecatronica',
    'Industrial',
    'Electronica',
    'Basicas'
  ];

  bool cargando = false;

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
        child: !cargando
            ? ListView(
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
                        const Text("Tus datos"),
                        CampoTexto(
                            etiqueta: 'Nombre(s)',
                            controller: controllerNombre,
                            ocultar: false),
                        CampoTexto(
                            etiqueta: 'Apellidos',
                            controller: controllerApellidos,
                            ocultar: false),
                        (esAlumno
                            ? CampoTexto(
                                etiqueta: 'Semestre',
                                controller: controllerSemestre,
                                ocultar: false)
                            : const Text('')),
                        const Text("Datos de acceso"),
                        CampoTexto(
                            etiqueta: 'Correo institucional',
                            controller: controllerEmail,
                            ocultar: false),
                        CampoTexto(
                            etiqueta: 'Contraseña para Tecgram',
                            controller: controllerPassword,
                            ocultar: true),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(esAlumno
                                    ? 'Tu carrera'
                                    : 'Tu departamento')),
                            obtenerDropdown(esAlumno ? carreras : departamentos,
                                esAlumno ? carrera : departamento)
                          ],
                        ),
                        Center(
                            child: ElevatedButton(
                                onPressed: () =>
                                    verificarFormulario(_form, context),
                                child: const Text("Registrarse")))
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: const [CupertinoActivityIndicator(radius: 20)],
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
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

  void verificarFormulario(formulario, BuildContext context) async {
    if (formulario.currentState!.validate()) {
      setState(() {
        cargando = true;
      });
      final authentication = auth();
      //final res = await authentication.login(controllerEmail.text, controllerPassword.text);
      final res = await authentication.signUp(
          controllerEmail.text,
          controllerPassword.text,
          esAlumno
              ? {
                  'rol': rolesKey[rol]!,
                  'career': careersKey[carrera]!,
                  'semester': controllerSemestre.text,
                  'name': controllerNombre.text,
                  'lastname': controllerApellidos.text
                }
              : {
                  'rol': rolesKey[rol]!,
                  'deparment': departamento,
                  'name': controllerNombre.text,
                  'lastname': controllerApellidos.text
                });
      setState(() {
        cargando = false;
      });

      if (res["success"] == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error: " + res["data"]),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          padding: const EdgeInsets.all(16.0),
        ));
      } else {

        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text('Registro completado'),
              contentPadding: EdgeInsets.all(16.0),
              children: [
                Text('Confirma tu registro mediante el enlace enviado a tu correo institucional.'),
                Center(child: SimpleDialogOption(onPressed: () => Navigator.pop(context), child: Text("Cerrar"),))
              ],
            );
          }
        );

        //Navigator.pushReplacementNamed(context, "home", arguments: res["data"]); -> Con esto pdoría entrar directamente a home pero debe confirmar registro.
        Navigator.pushReplacementNamed(context, "login");
      }
    }
  }

  void registrarse(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }
}
