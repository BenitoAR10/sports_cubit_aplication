class DatosLC {
  final int? idLugarComida;
  final String? nombreLugar;
  final String? logo;
  final String? direccion;

  DatosLC({
    this.idLugarComida,
    this.nombreLugar,
    this.logo,
    this.direccion,
  });

  factory DatosLC.fromJson(Map<String, dynamic> json) {
    return DatosLC(
      idLugarComida: json['idLugarComida'],
      nombreLugar: json['nombreLugar'],
      logo: json['logo'],
      direccion: json['direccion'],
    );
  }
}
