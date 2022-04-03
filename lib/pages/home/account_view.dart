import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../session/session.dart';

class AccountView extends StatefulWidget {
  AccountView({Key? key, required this.session}) : super(key: key);

  dynamic session;

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  static const List<String> imgs = [
    'https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/grupo2.jpg?alt=media&token=b2b44e63-4416-496e-b99e-e7e10f47689f',
    "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/grupo.jpg?alt=media&token=6ab380d0-65d0-47bb-bcdd-151552516abe",
    "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/paisaje.jpg?alt=media&token=aa50ceca-0098-4aa0-a4bf-df3aedd94dcd",
    "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/omar.jpg?alt=media&token=6e57c44f-0a1c-4635-87cc-a27518b2efab",
    "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/tec5.jpg?alt=media&token=585e3059-fa59-43e2-aec7-55475bce5c54",
    "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/tec6.jpg?alt=media&token=83a2e611-cbd4-4ef2-a6e0-52a68cdac99d"
  ];

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
    // return Center(
    //   child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Icon(Icons.account_circle),
    //         Text(widget.session["email"]),
    //         OutlinedButton(
    //             onPressed: cerrarSesion, child: Icon(Icons.logout))
    //       ]),
    // );
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            width: 75,
            height: 75,
            margin: EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/omar.jpg?alt=media&token=6e57c44f-0a1c-4635-87cc-a27518b2efab")))),
        Text("Omar Eli Aguilar López",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.5),
        Text("Sistemas Computacionales, Semestre:9", textScaleFactor: 1),
        Expanded(
          child: Container(
              //padding: EdgeInsets.all(32.0),
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.only(top: 32.0, right: 4.0, left: 4.0),
              constraints: BoxConstraints(minWidth: double.infinity),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black38),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      crearStat('Post', '16'),
                      crearStat('Followers', '3'),
                      crearStat('Follows', '42')
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: crearRejillaPosts(),
                  )
                ],
              )),
        )
      ],
    );
  }

  RichText crearStat(String nombre, String valor) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: nombre,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            children: <TextSpan>[
              TextSpan(
                  text: '\n' + valor,
                  style: TextStyle(color: Colors.black45, fontSize: 18))
            ]));
  }

  Widget crearRejillaPosts() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            //childAspectRatio: 3 / 2,
            childAspectRatio: 1,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4),
        itemCount: imgs.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(onTap: () {}),
            decoration: BoxDecoration(
              //shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imgs[index]),
              ),
            ),
            //decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          );
        });
  }
}
