import 'package:dio/dio.dart';

import '../models/dispositivo_model/dispositivo.dart';

class SolicitudesApi {
  final Dio _dio = Dio();
  final String url;

  SolicitudesApi({required this.url, BaseOptions? opciones}) {
    if (opciones != null) {
      _dio.options = opciones;
    }
  }

  Future<Dispositivos> obtenerDispositivos({
    required int maxFilas,
    required String fechaInicial,
    required String fechaFinal,
    int? offset,
  }) async {
    Map<String, dynamic> params = {
      "maxFilas" : maxFilas,
      "fechaInicial" : fechaInicial,
      "fechaFinal" : fechaFinal
    };

    try {
      if (offset != null) {
        params.addAll({"offset": offset});
      }

      Response res = await _dio.get(
        url,
        options: Options(
            contentType: Headers.jsonContentType
        ),
        queryParameters: params,
      );

      return Dispositivos.fromJson(res.data);
    } on DioException catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }
}