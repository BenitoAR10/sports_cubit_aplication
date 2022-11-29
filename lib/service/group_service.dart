import 'dart:convert';
import 'dart:core';

import 'package:sports_cubit_aplication/dto/account_info_dto.dart';
import 'package:http/http.dart' as http;
import 'package:sports_cubit_aplication/dto/response_dto.dart';
import 'package:sports_cubit_aplication/dto/rol_info_dto.dart';
import 'package:sports_cubit_aplication/service/host_service.dart' as host;

class GroupService {
  String backendUrlBase = host.backendUrlBase;

  Future<RolInfoDto> getRolgroup(String token) async {
    RolInfoDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/grupos");
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // invocamos al backend

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      // El back proceso la solicitud entonces decodificamos
      ResponseDto backendResponse =
          ResponseDto.fromJson(jsonDecode(response.body));
      print(backendResponse.data);
      if (backendResponse.success) {
        result = RolInfoDto.fromJson(backendResponse.data);
      } else {
        throw Exception(backendResponse.message);
      }
    } else {
      throw Exception("Error desconocido al consultar el grupo");
    }
    return result;
  }
}
