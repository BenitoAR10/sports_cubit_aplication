import 'package:flutter/cupertino.dart';

class PlanesLenDto {
  final int? idPlan;

  final int? cantidadMeses;
  final double? costo;

  PlanesLenDto({
    this.idPlan,
    this.cantidadMeses,
    this.costo,
  });

  factory PlanesLenDto.fromJson(Map<String, dynamic> json) {
    return PlanesLenDto(
      idPlan: json['idPlanEntrenador'],
      cantidadMeses: json['cantidadMeses'],
      costo: json['costo'],
    );
  }
}
