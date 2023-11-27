

import 'package:dio/dio.dart';
import 'package:reserva_parapente/apis/reserva_api.dart';
import 'package:reserva_parapente/modelo/reservaModelo.dart';

class ReservaRepository {
  ReservaApi? reservaApi;

  ReservaRepository() {
    Dio _dio = Dio();
    reservaApi = ReservaApi(_dio);
  }

  Future<List<ReservaModelo>> getReserva() async {
    // print('lllega');
    // late var data;
    // try {
      final data = await reservaApi!.listReserva();
      
    // } catch (e) {
    //   print(e);
    // }
        return data;  
  // }
  }
  Future<void> deleteReserva(int id) async {
    try {
      await reservaApi!.deleteReserva(id);
      print("Delete state pay successfylly");
    } catch (e) {
      print("Error delete state pay $e");
    }
  }


  Future<ReservaModelo> updateReserva(int id, ReservaModelo reserva) async {
    return await reservaApi!.updateReserva(id, reserva);
  }

  Future<ReservaModelo> createReserva(ReservaModelo reserva) async {
    return await reservaApi!.createReserva(reserva);
  }
}