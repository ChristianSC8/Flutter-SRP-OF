import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FormaPagoModelo {
  FormaPagoModelo({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.estado,
    required this.imagen,
    required this.urlImagen,
    required this.numero,
    required this.cci,
  });
  late final int id;
  late final String nombre;
  late final String descripcion;
  late final bool estado;
  late final String imagen;
  late final String urlImagen;
  late final int numero;
  late final String cci;
  
  factory FormaPagoModelo.fromJson(Map<String, dynamic> json){
    return FormaPagoModelo(
      id : json['id'],
      nombre : json['nombre'],
      descripcion : json['descripcion'],
      estado : json['estado'],
      imagen : json['imagen'],
      urlImagen : json['urlImagen'],
      numero : json['numero'],
      cci : json['cci'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['descripcion'] = descripcion;
    _data['estado'] = estado;
    _data['imagen'] = imagen;
    _data['urlImagen'] = urlImagen;
    _data['numero'] = numero;
    _data['cci'] = cci;
    return _data;
  }
}