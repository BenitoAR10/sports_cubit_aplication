import 'package:equatable/equatable.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarComida/responseDatosLugar_dto.dart';

import '../../status/page_status.dart';

class LCdatosState extends Equatable {
  final PageStatus? status;
  final DatosLC? datosLC;
  final String? errorMessage;

  const LCdatosState({
    this.status,
    this.datosLC,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        datosLC,
        errorMessage,
      ];
  LCdatosState copyWith({
    PageStatus? status,
    DatosLC? datosLC,
    String? errorMessage,
  }) {
    return LCdatosState(
      status: status ?? this.status,
      datosLC: datosLC ?? this.datosLC,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
