class AccountInfoDto{
  final String? nombre;
  final String? apellido;
  final String? correo;

  AccountInfoDto({
    this.nombre,
    this.apellido,
    this.correo,
  });

  factory AccountInfoDto.fromJson(Map<String, dynamic> json){
    return AccountInfoDto(
      nombre: json['nombre'],
      apellido: json['apellido'],
      correo: json['correo'],
    );
  }
}
