import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ReservaModelo {
  ReservaModelo({
    required this.id,
    required this.fechaInicio,
    required this.horaInicio,
    required this.nombreCliente,
    required this.cantidadPasajeros,
    required this.telefonoCliente,
    required this.correoCliente,
    required this.paqueteDeVueloId,
    required this.formaPagoId,
    required this.estadoPagoId,
  });
  late final int id;
  late final String fechaInicio;
  late final String horaInicio;
  late final String nombreCliente;
  late final int cantidadPasajeros;
  late final String telefonoCliente;
  late final String correoCliente;
  late final int paqueteDeVueloId;
  late final int formaPagoId;
  late final int estadoPagoId;
  
  ReservaModelo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fechaInicio = json['fechaInicio'];
    horaInicio = json['horaInicio'];
    nombreCliente = json['nombreCliente'];
    cantidadPasajeros = json['cantidadPasajeros'];
    telefonoCliente = json['telefonoCliente'];
    correoCliente = json['correoCliente'];
    paqueteDeVueloId = json['paqueteDeVueloId'];
    formaPagoId = json['formaPagoId'];
    estadoPagoId = json['estadoPagoId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fechaInicio'] = fechaInicio;
    _data['horaInicio'] = horaInicio;
    _data['nombreCliente'] = nombreCliente;
    _data['cantidadPasajeros'] = cantidadPasajeros;
    _data['telefonoCliente'] = telefonoCliente;
    _data['correoCliente'] = correoCliente;
    _data['paqueteDeVueloId'] = paqueteDeVueloId;
    _data['formaPagoId'] = formaPagoId;
    _data['estadoPagoId'] = estadoPagoId;
    return _data;
  }
}