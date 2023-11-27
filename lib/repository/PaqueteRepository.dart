
import 'package:dio/dio.dart';
import 'package:reserva_parapente/apis/paquete_api.dart';
import 'package:reserva_parapente/modelo/paqueteModelo.dart';

class PaqueteRepository {
  PaqueteApi? paqueteApi;

PaqueteRepository() {
    Dio _dio = Dio();
    paqueteApi = PaqueteApi(_dio);
  }

  Future<List<PaqueteModelo>> getPackages() async {
    final data = await paqueteApi!.listPaquete();
    return data;
  }

  Future<void> deletePackage(int id) async {
    try {
      await paqueteApi!.deletePaquete(id);
      print("Delete state pay successfylly");
    } catch (e) {
      print("Error delete state pay $e");
    }
  }


  Future<PaqueteModelo> updatePackage(int id, PaqueteModelo paquete) async {
    return await paqueteApi!.updatePaquete(id, paquete);
  }

  Future<PaqueteModelo> createPackage(PaqueteModelo paquete) async {
    return await paqueteApi!.crearPaquete(paquete);
  }

  
}