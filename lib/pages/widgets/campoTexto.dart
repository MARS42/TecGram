import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  String? etiqueta;
  TextEditingController? controller;
  bool ocultar;
  bool ver = false;

  final Icon? icono;

  CampoTexto(
      {Key? key,
      this.etiqueta,
      this.controller,
      this.ocultar = false,
      this.icono})
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
        obscureText: widget.ocultar ? !widget.ver : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.etiqueta,
          labelStyle: const TextStyle(
            fontSize: 16,
          ),
          prefixIcon: widget.icono,
          suffixIcon: widget.ocultar ? GestureDetector(
            child: Icon(widget.ver ? Icons.visibility_off : Icons.visibility),
            onTap: cambiarVisibilidad,
          ) : null,
        ),
      ),
    );
  }

  cambiarVisibilidad() {
    setState(() {
      widget.ver = !widget.ver;
    });
  }
}
