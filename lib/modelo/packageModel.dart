class PaqueteDeVuelo {
  int? id;
  String nombrePaquete;
  String descripcion;
  String? imagen;
  int duracion;
  double precio;
  bool estado;
  String? urlImagen;

  PaqueteDeVuelo({
    this.id,
    required this.nombrePaquete,
    required this.descripcion,
    required this.duracion,
    required this.precio,
    required this.estado,
    this.imagen,
    this.urlImagen,
  });

  factory PaqueteDeVuelo.fromJson(Map<String, dynamic> json) {
    return PaqueteDeVuelo(
      id: json['id'],
      nombrePaquete: json['nombre_paquete'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
      duracion: json['duracion'],
      precio: json['precio'].toDouble(),
      estado: json['estado'],
      urlImagen: json['urlImagen'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre_paquete': nombrePaquete,
      'descripcion': descripcion,
      'imagen': imagen,
      'duracion': duracion,
      'precio': precio,
      'estado': estado,
      'urlImagen': urlImagen,
    };
  }

  void actualizarPaquete({
    required String nuevoNombre,
    required String nuevaDescripcion,
    required String nuevaImagen,
    required int nuevaDuracion,
    required double nuevoPrecio,
    required bool nuevoEstado,
    required String nuevaUrlImagen,
  }) {
    this.nombrePaquete = nuevoNombre;
    this.descripcion = nuevaDescripcion;
    this.imagen = nuevaImagen;
    this.duracion = nuevaDuracion;
    this.precio = nuevoPrecio;
    this.estado = nuevoEstado;
    this.urlImagen = nuevaUrlImagen;
  }
}
