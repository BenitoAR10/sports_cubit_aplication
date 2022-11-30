import 'package:equatable/equatable.dart';

import 'package:sports_cubit_aplication/dto/pagesLugarEntrenamiento/planesLugar_dto.dart';

import '../../status/page_status.dart';

class LESplanesState extends Equatable {
  final PageStatus? status;
  final List<PlanesLeDto>? planesLeDto;
  final String? errorMessage;

  const LESplanesState({
    this.status,
    this.planesLeDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        planesLeDto,
        errorMessage,
      ];
  LESplanesState copyWith({
    PageStatus? status,
    List<PlanesLeDto>? planesLeDto,
    String? errorMessage,
  }) {
    return LESplanesState(
      status: status ?? this.status,
      planesLeDto: planesLeDto ?? this.planesLeDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
