import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class PaqueteModelo {
  PaqueteModelo({
    required this.id,
    required this.nombre_paquete,
    required this.descripcion,
    required this.imagen,
    required this.duracion,
    required this.precio,
    required this.estado,
    required this.urlImagen,
  });
  late final int id;
  late final String nombre_paquete;
  late final String descripcion;
  late final String imagen;
  late final int duracion;
  late final int precio;
  late final bool estado;
  late final String urlImagen;
  
  factory PaqueteModelo.fromJson(Map<String, dynamic> json){
  return PaqueteModelo(
    id: json['id'],
    nombre_paquete: json['nombre_paquete'],
    descripcion: json['descripcion'],
    imagen: json['imagen'],
    duracion: json['duracion'], 
    precio: json['precio'],     
    estado: json['estado'],
    urlImagen: json['urlImagen'],
  );
}

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre_paquete'] = nombre_paquete;
    _data['descripcion'] = descripcion;
    _data['imagen'] = imagen;
    _data['duracion'] = duracion;
    _data['precio'] = precio;
    _data['estado'] = estado;
    _data['urlImagen'] = urlImagen;
    return _data;
  }
}