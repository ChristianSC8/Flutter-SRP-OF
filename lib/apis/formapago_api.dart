import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:reserva_parapente/modelo/formapagoModelo.dart';
import 'package:reserva_parapente/utils/UrlApi.dart';
import 'package:retrofit/http.dart';

part 'formapago_api.g.dart';
@RestApi(baseUrl: UrlApi.urlApix)
abstract class FormapagoApi {
  factory FormapagoApi(Dio dio, {String baseUrl}) = _FormapagoApi;

  static FormapagoApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return FormapagoApi(dio);
  }

  @POST("/formapago")
  Future<FormaPagoModelo> creaFormapago(@Body() FormaPagoModelo formapago);

  @GET("/formapago/{id}")
  Future<FormaPagoModelo> getFormapago(@Path() int id);

  @PUT("/formapago/{id}")
  Future<FormaPagoModelo> updateFormapago(@Path() int id, @Body() FormaPagoModelo formapago);

  @DELETE("/formapago/{id}")
  Future<void> deleteFormapago(@Path() int id);

  @GET("/formapago")
  Future<List<FormaPagoModelo>> listFormapago();

}