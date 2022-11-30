import 'package:flutter/cupertino.dart';

class ClientesLeDto {
  final int? idCliente;
  final String? nombres;
  final String? apellidos;
  final int? cantidadMeses;
  final String? fechaInicio;
  final String? fechaFin;
  final double? costo;

  ClientesLeDto({
    Key? key,
    this.idCliente,
    this.nombres,
    this.apellidos,
    this.cantidadMeses,
    this.fechaInicio,
    this.fechaFin,
    this.costo,
  });

  factory ClientesLeDto.fromJson(Map<String, dynamic> json) {
    return ClientesLeDto(
      idCliente: json['idCuenta'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      cantidadMeses: json['cantidadMeses'],
      fechaInicio: json['fechaCompra'],
      fechaFin: json['fechaFin'],
      costo: json['costo'],
    );
  }
}
