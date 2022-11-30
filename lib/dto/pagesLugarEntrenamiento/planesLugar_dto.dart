import 'package:flutter/cupertino.dart';

class PlanesLeDto {
  final int? idLugarEntrenamiento;
  final int? idPlan;
  final int? cantidadMeses;
  final double? costo;

  PlanesLeDto({
    Key? key,
    this.idLugarEntrenamiento,
    this.idPlan,
    this.cantidadMeses,
    this.costo,
  });

  factory PlanesLeDto.fromJson(Map<String, dynamic> json) {
    return PlanesLeDto(
      idLugarEntrenamiento: json['idLugarEntrenamientoSucusal'],
      idPlan: json['idPlanLugarEntrenamiento'],
      cantidadMeses: json['cantidadMeses'],
      costo: json['costo'],
    );
  }
}
