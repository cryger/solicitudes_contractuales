import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const baseUrl = "https://esehospitalguaviare.gov.co/api_solicitudes";

  /* LOGIN */

  // ignore: strict_top_level_inference
  static Future login(usuario, password) async {

    final response = await http.post(

      Uri.parse("$baseUrl/login.php"),

      body: {

        "usuario": usuario,
        "password": password

      }

    );

    return jsonDecode(response.body);

  }

  /* LISTAR SOLICITUDES */

  static Future listarSolicitudes() async {

    final response = await http.get(
      Uri.parse("$baseUrl/listar_solicitudes.php")
    );

    return jsonDecode(response.body);

  }

  /* DETALLE SOLICITUD */

  static Future detalleSolicitud(id) async {

    final response = await http.get(
      Uri.parse("$baseUrl/detalle_solicitud.php?id=$id")
    );

    return jsonDecode(response.body);

  }

  /* RESPONDER SOLICITUD */

  static Future responderSolicitud(id,estado,respuesta) async {

    final response = await http.post(

      Uri.parse("$baseUrl/responder_solicitud.php"),

      body: {

        "id":id.toString(),
        "estado":estado,
        "respuesta":respuesta

      }

    );

    return jsonDecode(response.body);

  }

}