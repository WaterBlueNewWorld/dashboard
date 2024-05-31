import 'package:binding_prueba/models/estatus.dart';
import 'package:binding_prueba/models/sucursal_model/sucursal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../tipo.dart';
part 'dispositivo.freezed.dart';
part 'dispositivo.g.dart';

@freezed
class Dispositivo with _$Dispositivo {
  const factory Dispositivo({
    required String? idInventario,
    required String? nombre,
    required String? etiqueta,
    required int numInventario,
    required bool? enUso,
    required Estatus estatus,
    required Tipo tipo,
    required String? observaciones,
    required String? ip,
    required Sucursal sucursal,
  }) = _Dispositivo;

  String toStringFormateada() {
    return
      "Nombre: $nombre \n"
      "Etiqueta: $etiqueta \n"
      "Estatus: ${estatus.nombre}";
  }

  factory Dispositivo.fromJson(Map<String, dynamic> json) => _$DispositivoFromJson(json);
}
