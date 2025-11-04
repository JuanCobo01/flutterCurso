class Universidad {
  final String? id;
  final String nit;
  final String nombre;
  final String direccion;
  final String telefono;
  final String paginaWeb;

  Universidad({
    this.id,
    required this.nit,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.paginaWeb,
  });

  factory Universidad.fromMap(String id, Map<String, dynamic> map) {
    return Universidad(
      id: id,
      nit: map['nit'] ?? '',
      nombre: map['nombre'] ?? '',
      direccion: map['dirreccion'] ?? '',
      telefono: map['telefono'] ?? '',
      paginaWeb: map['pagina web'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nit': nit,
      'nombre': nombre,
      'dirreccion': direccion,
      'telefono': telefono,
      'pagina web': paginaWeb,
    };
  }
}