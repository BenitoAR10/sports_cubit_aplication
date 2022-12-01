import 'package:flutter/cupertino.dart';

class ClientesLenDto {
  final String? nombres;
  final String? apellidos;
  final int? cantidadMeses;
  final String? fechaInicio;
  final String? fechaFin;
  final double? costo;

  ClientesLenDto({
    this.nombres,
    this.apellidos,
    this.cantidadMeses,
    this.fechaInicio,
    this.fechaFin,
    this.costo,
  });

  factory ClientesLenDto.fromJson(Map<String, dynamic> json) {
    return ClientesLenDto(
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      cantidadMeses: json['cantidadMeses'],
      fechaInicio: json['fechaCompra'],
      fechaFin: json['fechaFin'],
      costo: json['costo'],
    );
  }
}
