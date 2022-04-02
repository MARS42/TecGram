import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecgram_app/api/auth.dart';
import 'package:tecgram_app/pages/singup_page.dart';
import 'package:tecgram_app/pages/widgets/campoTexto.dart';

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
      appBar: AppBar(title: const Text("TecGram"),),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Accede a tu cuenta", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Form(
              key: _formulario,
              child: !cargando
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CampoTexto(etiqueta: "Correo", controller: controllerEmail),
                  CampoTexto(etiqueta: "Contraseña", ocultar: true, controller: controllerPassword),
                  ElevatedButton(
                      child: const Text("Ingresar"),
                      onPressed: ()  => verificarFormulario(_formulario, context)
                  ),
                  OutlinedButton(onPressed: () => registrarse(context), child: const Text('No tengo cuenta'))
                ],
                  )
                  : const Center(child: CupertinoActivityIndicator(radius: 20,)),
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

      if (res[0] != "ok") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Correo o contraseña no válidos"),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(16.0),)
        );
      } else {
        Navigator.pushReplacementNamed(
            context, "home", arguments: res[1]);
      }
    }
  }

  void registrarse(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
  }
}

/// Crear un campo de texto
// Widget crearCampo(
//     { etiqueta,
//       ocultable = false,
//       required BuildContext context,
//       required TextEditingController controller }) {
//   return Container(
//     margin: const EdgeInsets.fromLTRB(0,0,0, 16.0),
//     child: TextFormField(
//       validator: (value) {
//         if(value != null && value.isEmpty)
//           return 'Es necesario este campo';
//       },
      
//       controller: controller,
//       obscureText: ocultable,
//       decoration: InputDecoration(
//         border: const OutlineInputBorder(),
//         labelText: etiqueta,
//         labelStyle: const TextStyle(
//           fontSize: 16,
//         )
//       ),
//     ),
//   );
// }
