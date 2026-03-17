import 'package:flutter/material.dart';
import '../services/api_service.dart';

class DetalleScreen extends StatefulWidget{

  final int id;

  DetalleScreen({required this.id});

  @override
  _DetalleScreenState createState()=>_DetalleScreenState();

}

class _DetalleScreenState extends State<DetalleScreen>{

  Map solicitud = {};

  bool loading = true;

  TextEditingController respuesta = TextEditingController();

  String estado = "En Proceso";

  cargarDetalle() async{

    var data = await ApiService.detalleSolicitud(widget.id);

    setState(() {

      solicitud = data;
      estado = data["estado"] ?? "En Proceso";
      loading = false;

    });

  }

  responder() async{

    await ApiService.responderSolicitud(

      widget.id,
      estado,
      respuesta.text

    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Respuesta guardada"))
    );

    Navigator.pop(context);

  }

  @override
  void initState() {

    super.initState();
    cargarDetalle();

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: Text("Detalle Solicitud"),
        backgroundColor: Color(0xff3366CC),
      ),

      body: loading
      ? Center(child: CircularProgressIndicator())
      : Padding(

        padding: EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text("Radicado: ${solicitud["codigo_radicado"]}"),

            SizedBox(height:10),

            Text("Nombre: ${solicitud["nombre"]}"),

            SizedBox(height:10),

            Text("Cédula: ${solicitud["cedula"]}"),

            SizedBox(height:10),

            Text("Correo: ${solicitud["correo"]}"),

            SizedBox(height:10),

            Text("Descripción:"),

            Text(solicitud["descripcion"] ?? ""),

            SizedBox(height:20),

            Text("Estado"),

            DropdownButton(

              value: estado,

              items: [

                "En Proceso",
                "Respondido",
                "Cerrado"

              ].map((e)=>DropdownMenuItem(

                child: Text(e),
                value: e,

              )).toList(),

              onChanged: (value){

                setState(() {
                  estado = value.toString();
                });

              },

            ),

            TextField(

              controller: respuesta,

              decoration: InputDecoration(
                labelText: "Respuesta"
              ),

            ),

            SizedBox(height:20),

            ElevatedButton(

              onPressed: responder,

              child: Text("Guardar respuesta"),

            )

          ],

        ),

      ),

    );

  }

}