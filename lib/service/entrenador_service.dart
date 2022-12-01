import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sports_cubit_aplication/service/host_service.dart' as host;

import '../dto/response_dto.dart';

class EntrenadorService{
  static Future<String> registrarDatosEntrenador(int idCuenta, String? fotoEntrenador, String nit, String correo, String token) async {
    String backendUrlBase = host.backendUrlBase;
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/");
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final body = {
      'idCuenta': idCuenta,
      'fotoEntrenador': fotoEntrenador,
      'nit': nit,
      'correo': correo
    };

    var response = await http.get(uri, headers: headers);
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
        registrarDatosEntrenador(idCuenta, fotoEntrenador, nit, correo, token);
      } else {
        throw Exception(responseDto.message);
      }

    return responseDto.data;

  }
}