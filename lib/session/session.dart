import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/*Class to save the token from php
save it into a storage with a key
 */
class Session {
  final storage = FlutterSecureStorage();
  final key =
      "iklowdklwhfksfjhaikoslfhwajklfhasfkljhaskflhnfjawhgfjklaefhbikuefgefg";
  set(String token) async {
    final data = {"token": token};
    await storage.write(key: key, value: jsonEncode(data));
  }

  get() async {
    final result = await storage.read(key: key);
    if (result != null) {
      return jsonDecode(result);
    }
  }

  delete() async {
    await storage.delete(key: key);
  }
}