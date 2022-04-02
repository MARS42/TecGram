import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:tecgram_app/pages/widgets/campoTexto.dart';

class MessagesPage extends StatefulWidget {

  MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  TextEditingController controllerBuscar = TextEditingController();

  List<dynamic> mssgs =[
    ["Steve Craft", '''I am trying to add a border radius to a LinearProgressIndicator in Flutter.
When I replace the LinearProgressIndicator with another widget (e.g. Text) in the code below, it works, as expected.''', "https://picsum.photos/300", "Ahora", false],
    ["Omar Campos", "Que hay bro", "https://picsum.photos/200", "Mar 5", false],
    ["Roberto Mtz", "Mensajes de prueba", "https://picsum.photos/300", "18:12", true],
    ["Lady Saori", "¡Viva Moyo!", "https://picsum.photos/150", "Dic 25", true],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CampoTexto(etiqueta: 'Busca un contacto', controller: controllerBuscar, icono: Icon(Icons.search),),
          Expanded(child: ListView.builder(itemCount: mssgs.length, itemBuilder: (BuildContext context, int i) => contenedorChat(mssgs[i][0], mssgs[i][1], mssgs[i][2], mssgs[i][3], mssgs[i][4])))
        ],
      ),
    );
  }

  static const margenChat = EdgeInsets.only( bottom: 8.0);
  static const paddingChat = EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 16.0);
  static const styleChat = BoxDecoration(color: Colors.black12, borderRadius:  BorderRadius.all(Radius.circular(100)));

  Widget contenedorChat(String user, String msg, String photo, String time, bool seen){
    return InkWell(
      onTap: () {},
      child: Container(
        margin: margenChat,
        padding: paddingChat,
        decoration: styleChat,
        child: Row(
          children: [
            Container(
              height: 64,
                width: 64,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(photo)
                    )
                )
            ),
            Expanded(
              child: Container(
                padding: paddingChat,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(user, style: TextStyle(fontWeight: FontWeight.bold, color: seen ? Colors.black45 : Colors.black), textScaleFactor: 1.15,),
                    Text(msg, overflow: TextOverflow.fade, maxLines: 2,
                    softWrap: false, style: TextStyle(color: seen ? Colors.black45 : Colors.black))],
                ),
              ),
            ),
            Text(time)
          ],
        )
      ),
    );
  }
}