import 'package:flutter/material.dart';

import '../../session/session.dart';

class AccountView extends StatefulWidget {
  AccountView({Key? key, required this.session}) : super(key: key);

  dynamic session;

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void cerrarSesion() async {
    await Session().delete();
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle),
            Text(widget.session["email"]),
            OutlinedButton(
                onPressed: cerrarSesion, child: Icon(Icons.logout))
          ]),
    );
  }
}
