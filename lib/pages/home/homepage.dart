import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          " Historias",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CupertinoButton(
                  child: Container(
                      height: 64,
                      width: 64,
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/agregar.png?alt=media&token=6ea61318-38ac-4725-9957-6e48a6090c2d")))),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                    height: 64,
                    width: 64,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 214, 67, 153), width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/lady.jpg?alt=media&token=42bc2f75-487a-45ff-a130-cdc2fa012094")))),
                SizedBox(
                  width: 20,
                ),
                Container(
                    height: 64,
                    width: 64,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 214, 67, 153), width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/victor.jpg?alt=media&token=c79def54-3160-44bc-8b06-dc9b17b463fb")))),
                SizedBox(
                  width: 20,
                ),
                Container(
                    height: 64,
                    width: 64,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 214, 67, 153), width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/adrian.jpg?alt=media&token=f068474d-fe62-45cc-ab59-a56b55f3a0b8")))),
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Column(children: [
            Container(
              child: Row(children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 214, 67, 153), width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/lady.jpg?alt=media&token=42bc2f75-487a-45ff-a130-cdc2fa012094")))),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Lady Laura Dominguez Acosta",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 800,
                height: 400,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/lady2.jpg?alt=media&token=997c6aea-df76-491e-9c12-cb9b2cd9189c',
                )),
            Container(
              child: Row(children: [
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.chat_bubble),
                  onPressed: () {},
                ),
              ]),
            )
          ]),
        ),
        Container(
          child: Column(children: [
            Container(
              child: Row(children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/rios2.jpg?alt=media&token=3613d6f8-a13b-4d10-a17c-ee7ae99fac97")))),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Evelin Rios Zarate",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 800,
                height: 400,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/rios.jpg?alt=media&token=a3856545-34a1-4579-ac50-a6cadbb7d28f',
                )),
            Container(
              child: Row(children: [
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.heart),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.chat_bubble),
                  onPressed: () {},
                ),
              ]),
            )
          ]),
        ),
        Container(
          child: Column(children: [
            Container(
              child: Row(children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://universidadesdemexico.mx/logos/original/logo-instituto-tecnologico-de-cuautla.webp")))),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Instituto Tecnlógico de Cuautla",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 650,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/tecgram-d61ad.appspot.com/o/tec3.jpg?alt=media&token=627672a0-d1fb-42cd-9c7f-8c877b6f62b2',
                )),
            Container(
              child: Row(children: [
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.heart),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.chat_bubble),
                  onPressed: () {},
                ),
              ]),
            )
          ]),
        )
      ],
    ));
  }
}
