import 'dart:convert';

import 'package:sports_cubit_aplication/dto/responde_dto.dart';
import 'package:sports_cubit_aplication/service/host_service.dart' as host;
import 'package:http/http.dart' as http;

class RegisterService {
  static Future<bool> registerAccount(
      String nombres,
      String apellidos,
      String numeroTelefono,
      String correo,
      String contrasenia
      ) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'nombres': nombres,
      'apellidos': apellidos,
      'numeroTelefono': numeroTelefono,
      'correo': correo,
      'contrasenia': contrasenia,          
    };
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/usuario/");
    var response = await http.post(uri, headers: header, body: jsonEncode(body));

    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      if (responseDto.success) {
        return responseDto.success;
      } else {
        throw Exception(responseDto.message);
      }
    } else {
      throw Exception("Error al registrar");
    }
  }

}
