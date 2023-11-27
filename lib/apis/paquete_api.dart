import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:reserva_parapente/modelo/paqueteModelo.dart';
import 'package:reserva_parapente/utils/UrlApi.dart';

import 'package:retrofit/http.dart';

part 'paquete_api.g.dart';
@RestApi(baseUrl: UrlApi.urlApix)
abstract class PaqueteApi {
  factory PaqueteApi(Dio dio, {String baseUrl}) = _PaqueteApi;

  static PaqueteApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return PaqueteApi(dio);
  }

  @POST("/paquetes")
  Future<PaqueteModelo> crearPaquete(@Body() PaqueteModelo paquete);

  @GET("/paquetes/{id}")
  Future<PaqueteModelo> getPaquete(@Path() int id);

  @PUT("/paquetes/{id}")
  Future<PaqueteModelo> updatePaquete(@Path() int id, @Body() PaqueteModelo paquete);

  @DELETE("/paquetes/{id}")
  Future<void> deletePaquete(@Path() int id);

  @GET("/paquetes")
  Future<List<PaqueteModelo>> listPaquete();

}