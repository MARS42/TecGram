import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:tecgram_app/pages/widgets/campoTexto.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  TextEditingController controllerBuscar = TextEditingController();

  List<dynamic> mssgs = [
    [
      "Lady Laura Dominguez Acosta",
      "Sistemas Computacionales,  9 semestre",
      "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/lady.jpg?alt=media&token=42bc2f75-487a-45ff-a130-cdc2fa012094",
    ],
    [
      "Jose Roberto Martinez Sanchez",
      "Sistemas computacionales, 9 semestre",
      "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/robert.jpg?alt=media&token=fb1f39f7-6f55-41e7-82d0-73b2129aba04"
    ],
    [
      "Jose Adrian Hernandez Ramirez",
      "Sistemas computacionales, 9 semestre",
      "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/adrian.jpg?alt=media&token=f068474d-fe62-45cc-ab59-a56b55f3a0b8",
    ],
    [
      "Victor Miguel Rios Romero",
      "Industrial",
      "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/victor.jpg?alt=media&token=c79def54-3160-44bc-8b06-dc9b17b463fb"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CampoTexto(
            etiqueta: 'Buscar a un usuario',
            controller: controllerBuscar,
            icono: Icon(Icons.search),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: mssgs.length,
                  itemBuilder: (BuildContext context, int i) => contenedorChat(
                        mssgs[i][0],
                        mssgs[i][1],
                        mssgs[i][2],
                      )))
        ],
      ),
    );
  }

  static const margenChat = EdgeInsets.only(bottom: 8.0);
  static const paddingChat =
      EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 16.0);
  static const styleChat =
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)));

  Widget contenedorChat(String user, String msg, String photo) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: margenChat,
          padding: paddingChat,
          decoration: styleChat,
          child: Row(
            children: [
              Container(
                  height: 32,
                  width: 32,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(photo)))),
              Expanded(
                child: Container(
                  padding: paddingChat,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        textScaleFactor: 1.15,
                      ),
                      Text(msg,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          softWrap: false,
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
