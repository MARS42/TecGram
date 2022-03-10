import 'package:http/http.dart' as http;
import 'dart:convert';

import '../session/session.dart';

class auth {
  final session = Session();

  static const URL = 'http://10.0.0.3:5000/login';

  login(String correo, String password) async {
    try {
      Map<String, String> body = {'email': correo, 'password': password};

      final respuesta = await http.post(Uri.parse(URL),
          headers: {
            "Accept": "application/json",
            "Access-Control_Allow_Origin": "*",
            'Content-Type': 'application/json'
          },
          body: json.encode(body));

      final perfil = json.decode(respuesta.body);

      String responseType = perfil["response"].runtimeType.toString();

      if (responseType == 'String') {
        if (respuesta.statusCode == 200 && !loginError(perfil["response"])) {
          return ['ok'];
        }
      } else {
        await session.set(perfil["response"]);
        return ['ok', perfil["response"]];
      }

      return ['', perfil['response']];
    } catch (e) {
      print("try: " + e.toString());
    }
  }

  loginError(String msg) {
    if (msg.isEmpty ||
        msg == "Email or password was incorrect" ||
        msg == "Error email and password can not be empity" ||
        msg == "Password is not valid" ||
        msg == "Email adress is invalid") return true;

    return false;
  }
}
