import 'dart:convert';

import 'package:sports_cubit_aplication/dto/response_dto.dart';
import 'package:sports_cubit_aplication/service/host_service.dart' as host;
import 'package:http/http.dart' as http;

class AddPlanLESservice {
  static Future<bool> addPlan(
      int idlugar, double costo, int cantidadMeses) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'idLugarEntrenamientoSucursal': idlugar,
      'costo': costo,
      'cantidadMeses': cantidadMeses,
    };
    var uri = Uri.parse("$backendUrlBase/api/v1/LugarEntrenamiento/plan");
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
