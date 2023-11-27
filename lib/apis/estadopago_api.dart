import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:reserva_parapente/modelo/estadopagoModelo.dart';
import 'package:reserva_parapente/utils/UrlApi.dart';
import 'package:retrofit/http.dart';

part 'estadopago_api.g.dart';
@RestApi(baseUrl: UrlApi.urlApix)
abstract class EstadopagoApi {
  factory EstadopagoApi(Dio dio, {String baseUrl}) = _EstadopagoApi;

  static EstadopagoApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return EstadopagoApi(dio);
  }

  @POST("/estado")
  Future<EstadopagoModelo> creaEstadopago(@Body() EstadopagoModelo user);

  @GET("/estado/{id}")
  Future<EstadopagoModelo> getEstadopago(@Path() int id);

  @PUT("/estado/{id}")
  Future<EstadopagoModelo> updateEstadopago(@Path() int id, @Body() EstadopagoModelo user);

  @DELETE("/estado/{id}")
  Future<void> deleteEstadopago(@Path() int id);

  @GET("/estado")
  Future<List<EstadopagoModelo>> listEstadospago();

}