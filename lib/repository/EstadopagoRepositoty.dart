import 'package:dio/dio.dart';
import 'package:reserva_parapente/apis/estadopago_api.dart';
import 'package:reserva_parapente/modelo/estadopagoModelo.dart';

class EstadoPagoRepository {
  EstadopagoApi? estadopagoApi;

  EstadoPagoRepository() {
    Dio _dio = Dio();
    estadopagoApi = EstadopagoApi(_dio);
  }

  Future<List<EstadopagoModelo>> getStates() async {
    final data = await estadopagoApi!.listEstadospago();
    return data;
  }

  Future<void> deleteStates(int id) async {
    try {
      await estadopagoApi!.deleteEstadopago(id);
      print("Delete state pay successfylly");
    } catch (e) {
      print("Error delete state pay $e");
    }
  }


  Future<EstadopagoModelo> updateStates(int id, EstadopagoModelo estadopago) async {
    return await estadopagoApi!.updateEstadopago(id, estadopago);
  }

  Future<EstadopagoModelo> createStates(EstadopagoModelo estadopago) async {
    return await estadopagoApi!.creaEstadopago(estadopago);
  }
}