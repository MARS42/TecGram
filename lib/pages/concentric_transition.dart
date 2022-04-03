import 'package:concentric_transition/page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConcentricTransition extends StatefulWidget {
  const ConcentricTransition({Key? key}) : super(key: key);

  @override
  _ConcentricTransitionState createState() => _ConcentricTransitionState();
}

class _ConcentricTransitionState extends State<ConcentricTransition> {
  List<dynamic> pages = [
    {
      'image':
          'https://ouch-cdn2.icons8.com/oEXWmNUZgj3vd_T5XSJe2dTB1GFWIBeJ1QEqRWw76O8/rs:fit:784:748/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMzM1/L2Q3MjMyYzJlLTk0/NTMtNDUzMC1iZTEx/LWQ2MDZiN2RjYmFm/Yy5wbmc.png'
    },
    {
      'image':
          'https://ouch-cdn2.icons8.com/yIxQmzj1OHH3S9AiIgelaTGdpj3wApWqSqFh80arSEA/rs:fit:784:828/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTMx/L2NmOGIzZmY4LWRh/YjEtNDdiMS1hZGQ4/LWFkMTUwZTQwNzIx/NC5wbmc.png',
    },
    {
      'image':
          'https://ouch-cdn2.icons8.com/g8bZd-d4qiYuomOBWh3x61II6HlK8Ir2zp_a2cFTcCA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDI4/LzdjMjEyYjgzLTg0/NjQtNDQzMS04NzAz/LTNkNzk1YmUyMzli/MC5wbmc.png'
    }
  ];
  List<String> frases = [
    "Revisa tu correo  para poder validar tu identidad",
    "Comparte tus experiencias con tus amigos",
    ""
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConcentricPageView(
      radius: 30,
      verticalPosition: 0.85,
      colors: [
        Colors.white,
        Colors.blueAccent,
        Color.fromARGB(255, 123, 78, 153)
      ],
      itemBuilder: (index, value) {
        int pageIndex = (index % pages.length);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¡Bienvenido a Tecgram!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Image.network(
              pages[pageIndex]['image'],
              width: 260,
            ),
            SizedBox(
              height: 20,
            ),
            pageIndex == 2
                ? CupertinoButton(
                    color: Colors.blue,
                    child: Text("Continuar"),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    })
                : Container(
                    child: Text(
                      pageIndex == 0 && pageIndex < 2
                          ? "Revisa tu correo  para poder\n validar tu identidad"
                          : "Comparte tus experiencias\n con tus amigos",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
          ],
        );
      },
    ));
  }
}
