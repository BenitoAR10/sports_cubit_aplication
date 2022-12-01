import 'dart:convert';

import 'package:sports_cubit_aplication/dto/pagesLugarComida/planesLugar_dto.dart';

import 'package:sports_cubit_aplication/service/host_service.dart' as host;
import 'package:http/http.dart' as http;
import 'package:sports_cubit_aplication/dto/response_dto.dart';

class LCplanesService {
  String backendUrlBase = host.backendUrlBase;

  Future<List<PlanesLCDto>> getplanes(int id) async {
    List<PlanesLCDto> result;
    String backendUrlBase = host.backendUrlBase;
    print("id enviado $id");
    var uri = Uri.parse("$backendUrlBase/api/v1/LugarComida/$id/planes");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      ResponseDto backendResponse =
          ResponseDto.fromJson(jsonDecode(response.body));
      if (backendResponse.success) {
        result = (backendResponse.data as List<dynamic>)
            .map((e) => PlanesLCDto.fromJson(e))
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
