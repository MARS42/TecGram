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
    'https://i.imgur.com/AhxYWsC.jpeg',
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
    "https://picsum.photos/200"
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
          width: 128.0,
          height: 128.0,
          margin: EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://i.imgur.com/BoN9kdC.png")
            ))
        ),
        Text("John Doe", textScaleFactor: 1.5),
        Text("@john_doe", textScaleFactor: 1),
        Expanded(
          child: Container(
            //padding: EdgeInsets.all(32.0),
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.only(top: 32.0, right: 4.0, left: 4.0),
            constraints: BoxConstraints(minWidth: double.infinity),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black38),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
            ),
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
                Expanded(
                  child: crearRejillaPosts(),
                )
              ],
            )
          ),
        )
      ],
    );
  }

  RichText crearStat(String nombre, String valor){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: nombre,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        children: <TextSpan>[
          TextSpan(text: '\n'+valor, style: TextStyle(color: Colors.black45, fontSize: 18))
        ])
      );
  }

  Widget crearRejillaPosts(){
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
            child: GestureDetector(onTap: () { }),
            decoration: BoxDecoration(
                //shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imgs[index]),
                ),
            ),
            //decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          );
        })
    ;
  }
}
