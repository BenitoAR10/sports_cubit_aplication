import 'package:equatable/equatable.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/responseDatosLugar_dto.dart';

import '../../status/page_status.dart';

class LENdatosState extends Equatable {
  final PageStatus? status;
  final DatosEntrenadorDto? datosEntrenadorDto;
  final String? errorMessage;

  const LENdatosState({
    this.status,
    this.datosEntrenadorDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        datosEntrenadorDto,
        errorMessage,
      ];
  LENdatosState copyWith({
    PageStatus? status,
    DatosEntrenadorDto? datosEntrenadorDto,
    String? errorMessage,
  }) {
    return LENdatosState(
      status: status ?? this.status,
      datosEntrenadorDto: datosEntrenadorDto ?? this.datosEntrenadorDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
