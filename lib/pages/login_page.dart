import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tecgram_app/api/auth.dart';
import 'package:tecgram_app/pages/singup_page.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Accede a tu cuenta", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Form(
              key: _formulario,
              child: !cargando
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  crearCampo(etiqueta: "Correo", context: context, controller: controllerEmail),
                  crearCampo(etiqueta: "Contraseña", ocultable: true, context: context, controller: controllerPassword),
                  ElevatedButton(
                      child: Text("Ingresar"),
                      onPressed: ()  => verificarFormulario(_formulario, context)
                  ),
                  OutlinedButton(onPressed: () => registrarse(context), child: Text('No tengo cuenta'))
                ],
                  )
                  : CupertinoActivityIndicator(radius: 20,),
            )
          ],
        ),
      ),
    );
  }

  void verificarFormulario(formulario, BuildContext context) async{
    if (formulario.currentState!.validate()) {
      setState(() {
        cargando = true;
      });
      final authentication = auth();
      final res = await authentication.login(controllerEmail.text, controllerPassword.text);
      setState(() {
        cargando = false;
      });

      if (res != "ok") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Contreña o usuario inválidos"),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(8.0),)
        );
      } else {
        Navigator.pushReplacementNamed(
            context, "home");
      }
    }
  }

  void registrarse(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }
}

/// Crear un campo de texto
Widget crearCampo(
    { etiqueta,
      ocultable = false,
      required BuildContext context,
      required TextEditingController controller }) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: (value) {
            if(value != null && value.isEmpty)
              return 'Es necesario este campo';
          },
          controller: controller,
          obscureText: ocultable,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: etiqueta,
            labelStyle: const TextStyle(
              fontSize: 16,
            )
          ),
        )
      ],
    ),
  );
}
