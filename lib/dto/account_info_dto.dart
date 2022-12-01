class AccountInfoDto {
  final String? nombre;
  final String? apellido;
  final String? correo;
  final int? id;
  final String? telefono;

  AccountInfoDto({
    this.nombre,
    this.apellido,
    this.correo,
    this.id,
    this.telefono,
  });

  factory AccountInfoDto.fromJson(Map<String, dynamic> json) {
    return AccountInfoDto(
      nombre: json['nombres'],
      apellido: json['apellidos'],
      correo: json['correo'],
      id: json['idCuenta'],
      telefono: json['telefono'],
    );
  }
}
