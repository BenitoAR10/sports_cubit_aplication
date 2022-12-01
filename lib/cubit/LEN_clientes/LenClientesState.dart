import 'package:equatable/equatable.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/clientesLugar_dto.dart';

import '../../status/page_status.dart';

class LENclientesState extends Equatable {
  final PageStatus? status;
  final List<ClientesLenDto>? clientesLenDto;
  final String? errorMessage;

  const LENclientesState({
    this.status,
    this.clientesLenDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        clientesLenDto,
        errorMessage,
      ];
  LENclientesState copyWith({
    PageStatus? status,
    List<ClientesLenDto>? clientesLenDto,
    String? errorMessage,
  }) {
    return LENclientesState(
      status: status ?? this.status,
      clientesLenDto: clientesLenDto ?? this.clientesLenDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
