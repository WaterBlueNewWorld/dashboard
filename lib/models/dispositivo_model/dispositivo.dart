// import 'package:dashboard/models/estatus.dart';
// import 'package:dashboard/models/sucursal_model/sucursal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
//
// import '../estatus.dart';
// import '../sucursal_model/sucursal.dart';
// import '../tipo.dart';
part 'dispositivo.freezed.dart';
part 'dispositivo.g.dart';

@freezed
class Dispositivos with _$Dispositivos {
  const factory Dispositivos({
    required List<Dispositivo> dispositivos,
  }) = _Dispositivos;

  factory Dispositivos.fromJson(Map<String, dynamic> json) => _$DispositivosFromJson(json);
}

@freezed
class Dispositivo with _$Dispositivo {
  const factory Dispositivo({
    required String idInventario,
    required int numInventario,
    required String? nombre,
    required String? etiqueta,
    required String? enUso,
    //required String? sucursal,
    required String? tipo,
    required String? estatus,
    required String? observaciones,

    /// TODO: por que no aparece en la db
    // required String? ip,
  }) = _Dispositivo;

  String toStringFormateada() {
    return
      "Nombre: $nombre \n"
      "Etiqueta: $etiqueta \n"
      "Estatus: $estatus \n"
      "Codigo Dispositivo: $idInventario \n"
    ;
      //"Estatus: ${estatus.nombre}";
  }

  factory Dispositivo.fromJson(Map<String, dynamic> json) => _$DispositivoFromJson(json);
}
