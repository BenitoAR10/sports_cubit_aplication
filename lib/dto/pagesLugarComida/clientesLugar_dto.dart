import 'package:flutter/cupertino.dart';

class ClientesLCDto {
  final int? idCuenta;
  final String? nombres;
  final String? apellidos;
  final double? costoMes;
  final String? fechaCompra;
  final String? fechaFin;
  final String? nombrePlan;
  final String? detalleComida;

  ClientesLCDto({
    this.idCuenta,
    this.nombres,
    this.apellidos,
    this.costoMes,
    this.fechaCompra,
    this.fechaFin,
    this.nombrePlan,
    this.detalleComida,
  });

  factory ClientesLCDto.fromJson(Map<String, dynamic> json) {
    return ClientesLCDto(
      idCuenta: json['idCuenta'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      costoMes: json['costoMes'],
      fechaCompra: json['fechaCompra'],
      fechaFin: json['fechaFin'],
      nombrePlan: json['nombrePlan'],
      detalleComida: json['detalleComida'],
    );
  }
}
