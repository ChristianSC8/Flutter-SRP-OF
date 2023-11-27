import 'package:http/http.dart' as http;
import 'package:reserva_parapente/modelo/packageModel.dart';
import 'dart:convert';


class ApiProvider {
  final String baseUrl = 'http://192.168.1.105:5000'; 

  Future<List<PaqueteDeVuelo>> fetchPaquetesDeVuelo() async {
    final response = await http.get(Uri.parse('$baseUrl/paquetes'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return List<PaqueteDeVuelo>.from(list.map((model) => PaqueteDeVuelo.fromJson(model)));
    } else {
      throw Exception('Error al obtener los paquetes de vuelo');
    }
  }

  Future<PaqueteDeVuelo> createPaqueteDeVuelo(PaqueteDeVuelo paquete, {int id = 0}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/paquetes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id': id, 
        'nombre_paquete': paquete.nombrePaquete,
        'descripcion': paquete.descripcion,
        'duracion': paquete.duracion,
        'precio': paquete.precio,
        'estado': paquete.estado,
        'imagen': paquete.imagen,
      }),
    );

    if (response.statusCode == 201) {
      return PaqueteDeVuelo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al crear el paquete de vuelo');
    }
  }
  Future<void> eliminarPaquete(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/paquetes/$id'));

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar el paquete');
    }
  }
  Future<void> editarPaquete(PaqueteDeVuelo paquete, String newImage) async {
    final url = Uri.parse('$baseUrl/paquetes/${paquete.id}');

    final Map<String, dynamic> paqueteData = {
      'nombre_paquete': paquete.nombrePaquete,
      'descripcion': paquete.descripcion,
      'duracion': paquete.duracion,
      'precio': paquete.precio,
      'estado': paquete.estado,

    };

    if (newImage.isNotEmpty) {

      paqueteData['imagen'] = newImage;
    }

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(paqueteData),
      );

      if (response.statusCode == 200) {
        // Paquete editado con éxito
      } else {
        throw Exception('Error al editar el paquete');
      }
    } catch (e) {
      throw Exception('Error al editar el paquete: $e');
    }
  }
  Future<void> updatePaquete(PaqueteDeVuelo paquete) async {
    final url = Uri.parse('$baseUrl/paquetes/${paquete.id}');

    final Map<String, dynamic> paqueteData = {
      'nombre_paquete': paquete.nombrePaquete,
      'descripcion': paquete.descripcion,
      'duracion': paquete.duracion,
      'precio': paquete.precio,
      'estado': paquete.estado,

    };

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(paqueteData),
      );

      if (response.statusCode == 200) {

      } else {
        throw Exception('Error al editar el paquete');
      }
    } catch (e) {
      throw Exception('Error al editar el paquete: $e');
    }
  }
}

