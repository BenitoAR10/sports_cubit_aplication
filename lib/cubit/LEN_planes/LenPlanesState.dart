import 'package:equatable/equatable.dart';

import 'package:sports_cubit_aplication/dto/pagesLugarEntrenador/planesLugar_dto.dart';

import '../../status/page_status.dart';

class LENplanesState extends Equatable {
  final PageStatus? status;
  final List<PlanesLenDto>? planesLenDto;
  final String? errorMessage;

  const LENplanesState({
    this.status,
    this.planesLenDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        planesLenDto,
        errorMessage,
      ];
  LENplanesState copyWith({
    PageStatus? status,
    List<PlanesLenDto>? planesLenDto,
    String? errorMessage,
  }) {
    return LENplanesState(
      status: status ?? this.status,
      planesLenDto: planesLenDto ?? this.planesLenDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
