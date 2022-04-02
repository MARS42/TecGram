import 'package:http/http.dart' as http;
import 'dart:convert';

import '../session/session.dart';

class auth {
  final session = Session();

  static const URL = 'https://tecgram.azurewebsites.net/';

  login(String correo, String password) async {
    try {
      Map<String, String> body = {'email': correo, 'password': password};

      final respuesta = await http.post(Uri.parse(URL + 'login'),
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

  signUp(String email, String password, Map<String, String> data) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
      'data': data
    };
    final respuesta = await http.post(Uri.parse(URL + 'signin'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          'Content-Type': 'application/json'
        },
        body: json.encode(body));

    print(respuesta.body);
    final register = json.decode(respuesta.body);

    if (register["response"] != "User added") {
      return { 'success': false, 'data': register["response"] };
    }

    return { 'success': true, 'data': await login(email, password) };
  }
}
