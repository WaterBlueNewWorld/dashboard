import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'modelo_prueba.freezed.dart';
part 'modelo_prueba.g.dart';

@freezed
class ModeloPrueba with _$ModeloPrueba {
  const factory ModeloPrueba({
    required int? numSucursal,
    required String? nombreSucursal,
    required String? nombreDispositivo,
    required String? codigoDispositivo,
  }) = _ModeloPrueba;

  factory ModeloPrueba.fromJson(Map<String, dynamic> json) => _$ModeloPruebaFromJson(json);
}
