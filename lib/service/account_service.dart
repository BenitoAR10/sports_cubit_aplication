import 'dart:convert';

import 'package:sports_cubit_aplication/dto/account_info_dto.dart';
import 'package:http/http.dart' as http;
import 'package:sports_cubit_aplication/dto/response_dto.dart';
import 'package:sports_cubit_aplication/dto/rol_info_dto.dart';
import 'package:sports_cubit_aplication/service/host_service.dart' as host;

class AccountService {
  String backendUrlBase = host.backendUrlBase;

  Future<AccountInfoDto> getAccountInfo(String token) async {
    AccountInfoDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/");
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
      if (backendResponse.success) {
        // si el back me envio la informacion de la cuenta lo extraemos
        result = AccountInfoDto.fromJson(backendResponse.data);
      } else {
        throw Exception(backendResponse.message);
      }
    } else {
      throw Exception("Error desconocido al consultar la cuenta");
    }
    return result;
  }
}
