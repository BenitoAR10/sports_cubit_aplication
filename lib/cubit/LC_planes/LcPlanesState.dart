import 'package:equatable/equatable.dart';
import 'package:sports_cubit_aplication/dto/pagesLugarComida/planesLugar_dto.dart';

import '../../status/page_status.dart';

class LCplanesState extends Equatable {
  final PageStatus? status;
  final List<PlanesLCDto>? planesLCDto;
  final String? errorMessage;

  const LCplanesState({
    this.status,
    this.planesLCDto,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        planesLCDto,
        errorMessage,
      ];
  LCplanesState copyWith({
    PageStatus? status,
    List<PlanesLCDto>? planesLCDto,
    String? errorMessage,
  }) {
    return LCplanesState(
      status: status ?? this.status,
      planesLCDto: planesLCDto ?? this.planesLCDto,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
