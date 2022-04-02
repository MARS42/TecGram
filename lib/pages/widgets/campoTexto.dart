import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  final String? etiqueta;
  final TextEditingController? controller;
  final bool ocultable;

  const CampoTexto(
      {
        Key? key,
        this.etiqueta,
        this.controller,
        this.ocultable = false
      })
      : super(key: key);

  @override
  State<CampoTexto> createState() => CampoTextoState();
}

class CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: TextFormField(
        validator: (value) {
          if (value != null && value.isEmpty) return 'Es necesario este campo';
        },
        controller: widget.controller,
        obscureText: widget.ocultable,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.etiqueta,
            labelStyle: const TextStyle(
              fontSize: 16,
            )),
      ),
    );
  }
}
