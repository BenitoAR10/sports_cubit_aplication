import 'dart:convert';

import 'package:sports_cubit_aplication/dto/response_dto.dart';
import 'package:sports_cubit_aplication/service/host_service.dart' as host;
import 'package:http/http.dart' as http;

class AddPlanLCservice {
  static Future<bool> addPlan(int idServicioComida, String nombrePlan,
      String descripcion, double costoMes) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'idServicioComida': idServicioComida,
      'nombrePlan': nombrePlan,
      'descripcion': descripcion,
      'costoMes': costoMes
    };
    var uri = Uri.parse("$backendUrlBase/api/v1/LugarComida/");
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
