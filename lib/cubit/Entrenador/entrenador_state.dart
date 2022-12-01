part of 'entrenador_cubit.dart';

class EntrenadorState extends Equatable {
  final PageStatus status;
  final String? message;
  final int idCuenta;
  final String? fotoEntrenador;
  final String nit;
  final String correo;

  const EntrenadorState({
    this.status = PageStatus.initial,
    this.message,
    this.idCuenta = 0,
    this.fotoEntrenador,
    this.nit = '',
    this.correo = '',
  });

  EntrenadorState copyWith({
    PageStatus? status,
    String? message,
    int? idCuenta,
    String? fotoEntrenador,
    String? nit,
    String? correo,
  }) {
    return EntrenadorState(
      status: status ?? this.status,
      message: message ?? this.message,
      idCuenta: idCuenta ?? this.idCuenta,
      fotoEntrenador: fotoEntrenador ?? this.fotoEntrenador,
      nit: nit ?? this.nit,
      correo: correo ?? this.correo,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        idCuenta,
        fotoEntrenador,
        nit,
        correo,
      ]; 

}

