import 'package:equatable/equatable.dart';

import '../../dto/pagesLugarEntrenamiento/responseDatosLugar_dto.dart';
import '../../status/page_status.dart';

class LugarEntrenamientoSucursalState extends Equatable {
  final PageStatus? status;
  final InfoLugarEntrenamientoDto? lugarEntrenamientoSucursalDto;
  final String? errorMessage;

  const LugarEntrenamientoSucursalState({
    this.status,
    this.lugarEntrenamientoSucursalDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        lugarEntrenamientoSucursalDto,
        errorMessage,
      ];
  LugarEntrenamientoSucursalState copyWith({
    PageStatus? status,
    InfoLugarEntrenamientoDto? lugarEntrenamientoSucursalDto,
    String? errorMessage,
  }) {
    return LugarEntrenamientoSucursalState(
      status: status ?? this.status,
      lugarEntrenamientoSucursalDto:
          lugarEntrenamientoSucursalDto ?? this.lugarEntrenamientoSucursalDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
