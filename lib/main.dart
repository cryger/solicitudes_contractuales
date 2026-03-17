import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Solicitudes Contractuales',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Color(0xff3366CC),
      ),

      home: LoginScreen(),

    );

  }

}