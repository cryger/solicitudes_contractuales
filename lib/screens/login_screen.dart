import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;

  login() async {

    setState(() {
      loading = true;
    });

    var data = await ApiService.login(
      usuario.text,
      password.text
    );

    setState(() {
      loading = false;
    });

    if(data["status"]=="ok"){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:(context)=>DashboardScreen()
        )
      );

    }else{

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Usuario o contraseña incorrectos")
        )
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Solicitudes Contractuales"),
        backgroundColor: Color(0xff3366CC),
      ),

      body: Center(

        child: Padding(

          padding: EdgeInsets.all(30),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Icon(
                Icons.account_circle,
                size: 100,
                color: Color(0xff3366CC),
              ),

              SizedBox(height:20),

              Text(
                "Ingreso Funcionarias",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height:30),

              TextField(

                controller: usuario,

                decoration: InputDecoration(

                  labelText: "Usuario",

                  border: OutlineInputBorder(),

                  prefixIcon: Icon(Icons.person)

                ),

              ),

              SizedBox(height:20),

              TextField(

                controller: password,

                obscureText: true,

                decoration: InputDecoration(

                  labelText: "Contraseña",

                  border: OutlineInputBorder(),

                  prefixIcon: Icon(Icons.lock)

                ),

              ),

              SizedBox(height:30),

              loading
              ? CircularProgressIndicator()
              : SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3366CC),
                    padding: EdgeInsets.all(15)
                  ),

                  onPressed: login,

                  child: Text(
                    "Ingresar",
                    style: TextStyle(fontSize:16),
                  ),

                ),

              )

            ],

          ),

        ),

      ),

    );

  }

}