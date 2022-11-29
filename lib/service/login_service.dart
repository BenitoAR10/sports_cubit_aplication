import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sports_cubit_aplication/dto/login_response_dto.dart';
import '../dto/response_dto.dart';
import 'package:http/http.dart' as http;
import 'package:sports_cubit_aplication/service/host_service.dart' as host;

// Los services unicamente realizaran solicitudes REST al back y retornaran los datos que el back nos responda
class LoginService {
  // Como es posible que la URL cambie de acuerdo a la red wifi entonces es recomendable tenerlo en una variable

  static String backendUrlBase = host.backendUrlBase;

  // Enviamos al back el correo y la contraseña para la validacion
  static Future<LoginResponseDto> login(
      String correo, String contrasenia) async {
    LoginResponseDto result;

    // Consultamos la URI para formatear espacios, tildes, etc
    // correo => "amír@gmail.com" URL => "am%C3%ADr%40gmail.com"
    // var uri = Uri.parse('http://7777/api/v1/auth/+ correo');

    var uri = Uri.parse("$backendUrlBase/api/v1/auth/");

    // Construimos el cuerpo de la solicitud REST de acuerdo a la especificacion del back

    var body = jsonEncode({
      "correo": correo,
      "contrasenia": contrasenia,
    });

    // Como es java es olbigatorio mandar Content-type y Accept

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    // Realizamos la invocation al back con los datos proporcionado

    var response = await http.post(uri, headers: headers, body: body);

    // Se a decido que cualquiera fuera la respuesta del back siempre se retornara 200, cualquier otra cosa sera un error

    if (response.statusCode == 200) {
      // 200 significa que el backend proceso la solicitud.
      // Decodifficamos el JSON a un objecto Response
      var responseDto = ResponseDto.fromJson(jsonDecode(response.body));
      // preguntamos si el back nos responde exito
      if (responseDto.success) {
        // Decodificamos la data del obejto response del back y lo convertimos a una clase dart LoginResponseDto
        result = LoginResponseDto.fromJson(responseDto.data);
      } else {
        throw Exception(responseDto.message);
      }
    } else {
      throw Exception("Error al inciar sesion");
    }
    return result;
  }

  // Metodo la obtener los grupos de la cuenta

  // static Future<List<String>> getGrupos(String? token) async {
  //   // Obtenemos el token de la cuenta
  //   List<LoginResponseDto> result;
  //   String backendUrlBase = host.backendUrlBase;
  //   final header = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   var uri = Uri.parse("$backendUrlBase/api/v1/cuenta/grupos/");
  //   var response = await http.get(uri, headers: header);
  //   ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
  //   if (response.statusCode == 200) {
  //     var responseDto = jsonDecode(response.body);
  //     // El back proceso la solicitud entonces decodificamos
  //     ResponseDto backendResponse = ResponseDto.fromJson(jsonDecode(response.body));
  //     if (backendResponse.success){
  //       // extraemos la informacion de la cuenta en una lista
  //       List<String> grupos = List<String>.from(backendResponse.data);

  //     } else{
  //       throw Exception(backendResponse.message);
  //     }
  //   }
  //   return List<String>.from(backendResponse.data);
  // }
}
