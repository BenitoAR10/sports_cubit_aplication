import 'dart:convert';

import 'package:sports_cubit_aplication/dto/response_dto.dart';
import 'package:sports_cubit_aplication/service/host_service.dart' as host;
import 'package:http/http.dart' as http;

class RegisterService {
  static Future<bool> registerAccount(String correo, String contrasenia,
      String nombre, String apellido, String numeroTelefono) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'correo': correo,
      'contrasenia': contrasenia,
      'nombre': nombre,
      'apellido': apellido,
      'numeroTelefono': numeroTelefono,
    };
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/usuario/");
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

  static Future<bool> registerAccountCouch(String correo, String contrasenia,
      String nombre, String apellido, String numeroTelefono) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'correo': correo,
      'contrasenia': contrasenia,
      'nombre': nombre,
      'apellido': apellido,
      'numeroTelefono': numeroTelefono,
    };
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/entrenador/");
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

  static Future<bool> registerAccountStore(String correo, String contrasenia,
      String nombre, String apellido, String numeroTelefono) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'correo': correo,
      'contrasenia': contrasenia,
      'nombre': nombre,
      'apellido': apellido,
      'numeroTelefono': numeroTelefono,
    };
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/tienda");
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

  static Future<bool> registerAccountFoodService(
      String correo,
      String contrasenia,
      String nombre,
      String apellido,
      String numeroTelefono) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'correo': correo,
      'contrasenia': contrasenia,
      'nombre': nombre,
      'apellido': apellido,
      'numeroTelefono': numeroTelefono,
    };
    var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/servicio-comida/");
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

  static Future<bool> registerAccountTrainingPlace(
      String correo,
      String contrasenia,
      String nombre,
      String apellido,
      String numeroTelefono) async {
    String backendUrlBase = host.backendUrlBase;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final body = {
      'correo': correo,
      'contrasenia': contrasenia,
      'nombre': nombre,
      'apellido': apellido,
      'numeroTelefono': numeroTelefono,
    };
    var uri =
        Uri.parse("$backendUrlBase/api/v1/cuenta/servicio-lg-entrenamiento/");
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
