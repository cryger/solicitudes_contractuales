import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'detalle_screen.dart';

class SolicitudesScreen extends StatefulWidget {

  @override
  _SolicitudesScreenState createState() => _SolicitudesScreenState();

}

class _SolicitudesScreenState extends State<SolicitudesScreen>{

  List solicitudes = [];

  bool loading = true;

  cargarSolicitudes() async {

    var data = await ApiService.listarSolicitudes();

    setState(() {

      solicitudes = data;
      loading = false;

    });

  }

  @override
  void initState() {

    super.initState();
    cargarSolicitudes();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Solicitudes"),
        backgroundColor: Color(0xff3366CC),
      ),

      body: loading
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(

        itemCount: solicitudes.length,

        itemBuilder: (context,index){

          var s = solicitudes[index];

          return Card(

            margin: EdgeInsets.symmetric(horizontal:10,vertical:5),

            child: ListTile(

              title: Text("Radicado: ${s["codigo_radicado"]}"),

              subtitle: Text("${s["nombre"]}"),

              trailing: Text(s["estado"] ?? ""),

              onTap:(){

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(context)=>DetalleScreen(
                      id:s["id"]
                    )

                  )

                );

              },

            ),

          );

        },

      ),

    );

  }

}