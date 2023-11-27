
import 'package:dio/dio.dart';
import 'package:reserva_parapente/apis/formapago_api.dart';
import 'package:reserva_parapente/modelo/formapagoModelo.dart';

class FormaPagoRepository {
  FormapagoApi? formapagoApi;

  FormaPagoRepository() {
    Dio _dio = Dio();
    formapagoApi = FormapagoApi(_dio);
  }

  Future<List<FormaPagoModelo>> getFormapago() async {
    final data = await formapagoApi!.listFormapago();
    return data;
  }

  Future<void> deleteFormapago(int id) async {
    try {
      await formapagoApi!.deleteFormapago(id);
      print("Delete state pay successfylly");
    } catch (e) {
      print("Error delete state pay $e");
    }
  }


  Future<FormaPagoModelo> updateFormapago(int id, FormaPagoModelo formapago) async {
    return await formapagoApi!.updateFormapago(id, formapago);
  }

  Future<FormaPagoModelo> createFormapago(FormaPagoModelo formapago) async {
    return await formapagoApi!.creaFormapago(formapago);
  }
}