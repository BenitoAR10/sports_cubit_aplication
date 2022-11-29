class InfoLugarEntrenamientoDto {
  final int? id;
  final String? nombre;
  final String? logo;
  final String? direccion;

  InfoLugarEntrenamientoDto({
    this.id,
    this.nombre,
    this.logo,
    this.direccion,
  });

  factory InfoLugarEntrenamientoDto.fromJson(Map<String, dynamic> json) {
    return InfoLugarEntrenamientoDto(
      id: json['idLugarEntrenamientoSucursal'],
      nombre: json['nombre'],
      logo: json['logo'],
      direccion: json['direccion'],
    );
  }
}
