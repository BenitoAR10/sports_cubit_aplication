class RolInfoDto {
  String? rol;

  RolInfoDto({
    this.rol,
  });

  //generar gettter y setter
  String get getRol => rol!;
  set setRol(String? rol) => this.rol = rol;

  factory RolInfoDto.fromJson(dynamic json) {
    return RolInfoDto(
      rol: json.toString(),
    );
  }

  //metodo para convertir el objeto a un mapa
  Map<String, dynamic> toJson() => {
        'rol': rol,
      };

  //metodo para convertir el objeto a un string
  @override
  String toString() {
    return 'RolInfoDto{rol: $rol}';
  }
}
