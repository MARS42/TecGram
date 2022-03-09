import 'package:http/http.dart' as http;
import 'dart:convert';

class auth {
  static const URL = '127.0.0.1';

  login(String correo, String password) async {
    final respuesta = await http.get(Uri.parse(URL + '/login'), headers: {});
    final perfil = json.decode(respuesta.body);
    if (respuesta.statusCode == 200) {
      return 'ok';
    }

    return perfil['mensaje'];
  }
}
