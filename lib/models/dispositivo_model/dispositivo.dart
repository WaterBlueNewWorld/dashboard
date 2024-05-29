import 'package:binding_prueba/models/sucursal_model/sucursal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'dispositivo.freezed.dart';
part 'dispositivo.g.dart';

@freezed
class Dispositivo with _$Dispositivo {
  const factory Dispositivo({
    required String? nombre,
    required String? etiqueta,
    required String? codigo,
    required bool? enUso,
    required String? estatus,
    required String? observaciones,
    required String? ip,
    required Sucursal sucursal,
  }) = _Dispositivo;

  factory Dispositivo.fromJson(Map<String, dynamic> json) => _$DispositivoFromJson(json);
}
