// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispositivo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DispositivoImpl _$$DispositivoImplFromJson(Map<String, dynamic> json) =>
    _$DispositivoImpl(
      idInventario: json['idInventario'] as String?,
      nombre: json['nombre'] as String?,
      etiqueta: json['etiqueta'] as String?,
      numInventario: (json['numInventario'] as num).toInt(),
      enUso: json['enUso'] as bool?,
      estatus: $enumDecode(_$EstatusEnumMap, json['estatus']),
      tipo: $enumDecode(_$TipoEnumMap, json['tipo']),
      observaciones: json['observaciones'] as String?,
      ip: json['ip'] as String?,
      sucursal: Sucursal.fromJson(json['sucursal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DispositivoImplToJson(_$DispositivoImpl instance) =>
    <String, dynamic>{
      'idInventario': instance.idInventario,
      'nombre': instance.nombre,
      'etiqueta': instance.etiqueta,
      'numInventario': instance.numInventario,
      'enUso': instance.enUso,
      'estatus': _$EstatusEnumMap[instance.estatus]!,
      'tipo': _$TipoEnumMap[instance.tipo]!,
      'observaciones': instance.observaciones,
      'ip': instance.ip,
      'sucursal': instance.sucursal,
    };

const _$EstatusEnumMap = {
  Estatus.procesado: 'procesado',
  Estatus.activo: 'activo',
  Estatus.enviado: 'enviado',
  Estatus.descargado: 'descargado',
  Estatus.cancelado: 'cancelado',
  Estatus.na: 'na',
};

const _$TipoEnumMap = {
  Tipo.a: 'a',
};
