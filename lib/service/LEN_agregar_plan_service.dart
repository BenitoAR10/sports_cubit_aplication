import 'dart:convert';

import 'package:sports_cubit_aplication/dto/response_dto.dart';
import 'package:sports_cubit_aplication/service/host_service.dart' as host;
import 'package:http/http.dart' as http;

class AddPlanLENservice {
  static Future<bool> addPlan(
      int idEntrenador, double costo, int cantidadMeses) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'idEntrenador': idEntrenador,
      'costo': costo,
      'cantidadMeses': cantidadMeses,
    };
    var uri = Uri.parse("$backendUrlBase/api/v1/Entrenador/plan");
    var response =
        await http.post(uri, headers: header, body: jsonEncode(body));

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
