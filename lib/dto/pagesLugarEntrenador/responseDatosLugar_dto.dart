class DatosEntrenadorDto {
  final int? idEntrenador;
  final String? nombre;
  final String? apellido;
  final String? foto;

  DatosEntrenadorDto({
    this.idEntrenador,
    this.nombre,
    this.apellido,
    this.foto,
  });

  factory DatosEntrenadorDto.fromJson(Map<String, dynamic> json) {
    return DatosEntrenadorDto(
      idEntrenador: json['idEntrenador'],
      nombre: json['nombre'],
      apellido: json['apellidos'],
      foto: json['fotoEntrenador'],
    );
  }
}
