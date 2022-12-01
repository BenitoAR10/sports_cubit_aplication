import 'package:flutter/cupertino.dart';

class PlanesLCDto {
  final int? idPlanComida;
  final String? nombrePlan;
  final double? costoMes;
  final String? descripcion;

  PlanesLCDto({
    this.idPlanComida,
    this.nombrePlan,
    this.costoMes,
    this.descripcion,
  });

  factory PlanesLCDto.fromJson(Map<String, dynamic> json) {
    return PlanesLCDto(
      idPlanComida: json['idPlanComida'],
      nombrePlan: json['nombrePlan'],
      costoMes: json['costoMes'],
      descripcion: json['descripcion'],
    );
  }
}
