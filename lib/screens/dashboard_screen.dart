import 'package:flutter/material.dart';
import 'solicitudes_screen.dart';

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Panel de Solicitudes"),
        backgroundColor: Color(0xff3366CC),
      ),

      body: Padding(

        padding: EdgeInsets.all(20),

        child: Column(

          children: [

            Card(

              child: ListTile(

                leading: Icon(Icons.list),

                title: Text("Ver solicitudes"),

                subtitle: Text("Consultar solicitudes contractuales"),

                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>SolicitudesScreen()
                    )
                  );

                },

              ),

            ),

          ],

        ),

      ),

    );

  }

}