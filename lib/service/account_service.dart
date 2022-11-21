import 'dart:convert';

import 'package:sports_cubit_aplication/dto/account_info_dto.dart';
import 'package:http/http.dart' as http;
import 'package:sports_cubit_aplication/dto/responde_dto.dart';

class AccountService{
  static const String backendUrlBase = "http://";

  Future <AccountInfoDto> getAccountInfo(String token) async{
    AccountInfoDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "Bearer $token",
    };

    // invocamos al backend

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
      if (backendResponse.success){
        result = AccountInfoDto.fromJson(backendResponse.data);
      } else{
        throw Exception(backendResponse.message);
      }
    } else {
      throw Exception("Error desconocido al consultar la cuenta");
    }
    return result;
  }
}