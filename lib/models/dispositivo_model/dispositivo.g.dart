// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispositivo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DispositivoImpl _$$DispositivoImplFromJson(Map<String, dynamic> json) =>
    _$DispositivoImpl(
      nombre: json['nombre'] as String?,
      etiqueta: json['etiqueta'] as String?,
      codigo: json['codigo'] as String?,
      enUso: json['enUso'] as bool?,
      estatus: json['estatus'] as String?,
      observaciones: json['observaciones'] as String?,
      ip: json['ip'] as String?,
    );

Map<String, dynamic> _$$DispositivoImplToJson(_$DispositivoImpl instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'etiqueta': instance.etiqueta,
      'codigo': instance.codigo,
      'enUso': instance.enUso,
      'estatus': instance.estatus,
      'observaciones': instance.observaciones,
      'ip': instance.ip,
    };
