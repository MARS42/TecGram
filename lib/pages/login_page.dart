import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecgram_app/api/Auth.dart';

/// Página de Login y registro
class LoginPage extends StatefulWidget {
  const LoginPage ({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formulario = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  bool cargando = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("TecGram"),),
      body: Column(
        children: [
          Text("¡Hola de nuevo!"),
          Text("Accede a tu cuenta"),
          Form(
            key: _formulario,
            child: !cargando
                ? Column(
              children: [
                crearCampo(etiqueta: "Correo", context: context, controller: controllerEmail),
                crearCampo(etiqueta: "Contraseña", ocultable: true, context: context, controller: controllerPassword),
                MaterialButton(onPressed:  () => verificarFormulario(_formulario, context))
              ],
                )
                : CupertinoActivityIndicator(radius: 20,),
          )
        ],
      )
    );
  }

  void verificarFormulario(formulario, BuildContext context) async{
    if (formulario.currentState!.validate()) {
      setState(() {
        cargando = true;
      });
      final auth = Auth();
      final res = await auth.login(controllerEmail.text, controllerPassword.text);
      setState(() {
        cargando = false;
      });

      if (res != "ok") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Contreña o usuario inválidos"),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(4.0),)
        );
      } else {
        Navigator.pushReplacementNamed(
            context, "home");
      }
    }
  }
}

Widget crearCampo(
    { etiqueta,
      ocultable = false,
      required BuildContext context,
      required TextEditingController controller }) {
  return Column(
    children: [
      Text(etiqueta),
      TextFormField(
        validator: (value) {
          if(value != null && value.isEmpty)
            return etiqueta + ' está vacío';
        },
        controller: controller,
        obscureText: ocultable,
      )
    ],
  );
}
