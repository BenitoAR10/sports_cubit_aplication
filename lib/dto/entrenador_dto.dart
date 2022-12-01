import 'dart:convert';

class EntrenadorDto{
  EntrenadorDto({
    required this.idCuenta,
    required this.nit,
    required this.correo,
    this.fotoEntrenador,
  });

  int idCuenta;
  String nit;
  String correo;
  String? fotoEntrenador;

  factory EntrenadorDto.fromJson(String str) => EntrenadorDto.fromMap(json.decode(str));

  factory EntrenadorDto.fromMap(Map<String, dynamic> json) => EntrenadorDto(
    idCuenta: json["idCuenta"],
    nit: json["nit"],
    correo: json["correo"],
    fotoEntrenador: json["fotoEntrenador"],
  );

}