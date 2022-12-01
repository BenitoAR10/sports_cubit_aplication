import 'dart:convert';

import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/responseDatosLugar_dto.dart';

import 'package:sports_cubit_aplication/service/host_service.dart' as host;
import 'package:http/http.dart' as http;
import 'package:sports_cubit_aplication/dto/response_dto.dart';

class LugarEntrenadorService {
  String backendUrlBase = host.backendUrlBase;

  Future<DatosEntrenadorDto> getLugarEntrenador(int id) async {
    DatosEntrenadorDto result;
    String backendUrlBase = host.backendUrlBase;
    var uri = Uri.parse("$backendUrlBase/api/v1/Entrenador/$id");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      ResponseDto backendResponse =
          ResponseDto.fromJson(jsonDecode(response.body));
      if (backendResponse.success) {
        result = DatosEntrenadorDto.fromJson(backendResponse.data);
      } else {
        throw Exception(backendResponse.message);
      }
    } else {
      throw Exception("Error desconocido al consultar la cuenta");
    }
    return result;
  }
}
