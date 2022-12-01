import 'package:equatable/equatable.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarComida/clientesLugar_dto.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/clientesLugar_dto.dart';

import '../../status/page_status.dart';

class LCclientesState extends Equatable {
  final PageStatus? status;
  final List<ClientesLCDto>? clientesLcDto;
  final String? errorMessage;

  const LCclientesState({
    this.status,
    this.clientesLcDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        clientesLcDto,
        errorMessage,
      ];
  LCclientesState copyWith({
    PageStatus? status,
    List<ClientesLCDto>? clientesLcDto,
    String? errorMessage,
  }) {
    return LCclientesState(
      status: status ?? this.status,
      clientesLcDto: clientesLcDto ?? this.clientesLcDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
