import 'dart:convert';

import 'package:sports_cubit_aplication/dto/pagesLugarEntrenamiento/planesLugar_dto.dart';

import 'package:sports_cubit_aplication/service/host_service.dart' as host;
import 'package:http/http.dart' as http;
import 'package:sports_cubit_aplication/dto/response_dto.dart';

class LugarEplanesService {
  String backendUrlBase = host.backendUrlBase;

  Future<List<PlanesLeDto>> getplanesLE(int id) async {
    List<PlanesLeDto> result;
    String backendUrlBase = host.backendUrlBase;
    var uri = Uri.parse("$backendUrlBase/api/v1/LugarEntrenamiento/$id/planes");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      ResponseDto backendResponse =
          ResponseDto.fromJson(jsonDecode(response.body));
      if (backendResponse.success) {
        result = (backendResponse.data as List<dynamic>)
            .map((e) => PlanesLeDto.fromJson(e))
            .toList();
      } else {
        throw Exception(backendResponse.message);
      }
    } else {
      throw Exception("Error desconocido al consultar la cuenta");
    }
    return result;
  }
}
