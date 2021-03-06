import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecgram_app/api/auth.dart';
import 'package:tecgram_app/pages/singup_page.dart';
import 'package:tecgram_app/pages/widgets/campoTexto.dart';
import 'dart:async';

/// Página de Login y registro
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formulario = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  bool cargando = false;
  int activeIndex = 0;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 350,
                    child: Image.network(
                      'https://ouch-cdn2.icons8.com/vSx9H3yP2D4DgVoaFPbE4HVf6M4Phd-8uRjBZBnl83g/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNC84/MzcwMTY5OS1kYmU1/LTQ1ZmEtYmQ1Ny04/NTFmNTNjMTlkNTcu/c3Zn.png',
                      height: 400,
                    )),
                SizedBox(
                  height: 40,
                ),
                const Text("Accede a tu cuenta",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Form(
                  key: _formulario,
                  child: !cargando
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CampoTexto(
                                etiqueta: "Correo",
                                controller: controllerEmail),
                            CampoTexto(
                                etiqueta: "Contraseña",
                                ocultar: true,
                                controller: controllerPassword),
                            CupertinoButton(
                                color: Color.fromARGB(255, 17, 58, 102),
                                child: const Text("Ingresar"),
                                onPressed: () =>
                                    verificarFormulario(_formulario, context)),
                            SizedBox(
                              height: 6,
                            ),
                            CupertinoButton(
                                onPressed: () => registrarse(context),
                                child: Text("No tengo una cuenta"))
                          ],
                        )
                      : const Center(
                          child: CupertinoActivityIndicator(
                          radius: 20,
                        )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void verificarFormulario(formulario, BuildContext context) async {
    if (formulario.currentState!.validate()) {
      setState(() {
        cargando = true;
      });
      final authentication = auth();
      final res = await authentication.login(
          controllerEmail.text, controllerPassword.text);
      setState(() {
        cargando = false;
      });

      if (res[0] != "ok") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Correo o contraseña no válidos"),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(16.0),
        ));
      } else {
        Navigator.pushReplacementNamed(context, "main", arguments: res[1]);
      }
    }
  }

  void registrarse(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpPage()));
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
