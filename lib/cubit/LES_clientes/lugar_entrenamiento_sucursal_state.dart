import 'package:equatable/equatable.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenamiento/clientesLugar_dto.dart';

import '../../status/page_status.dart';

class LESclientesState extends Equatable {
  final PageStatus? status;
  final List<ClientesLeDto>? clientesLeDto;
  final String? errorMessage;

  const LESclientesState({
    this.status,
    this.clientesLeDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        clientesLeDto,
        errorMessage,
      ];
  LESclientesState copyWith({
    PageStatus? status,
    List<ClientesLeDto>? clientesLeDto,
    String? errorMessage,
  }) {
    return LESclientesState(
      status: status ?? this.status,
      clientesLeDto: clientesLeDto ?? this.clientesLeDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
