import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'sucursal.freezed.dart';
part 'sucursal.g.dart';

@freezed
class Sucursal with _$Sucursal {
  const factory Sucursal({
    required String? nombre,
  }) = _Sucursal;

  bool isEqual (Sucursal model) => nombre == model.nombre;

  factory Sucursal.fromJson(Map<String, dynamic> json) => _$SucursalFromJson(json);
}
