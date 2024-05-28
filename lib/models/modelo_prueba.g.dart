// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelo_prueba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModeloPruebaImpl _$$ModeloPruebaImplFromJson(Map<String, dynamic> json) =>
    _$ModeloPruebaImpl(
      numSucursal: (json['numSucursal'] as num?)?.toInt(),
      nombreSucursal: json['nombreSucursal'] as String?,
      nombreDispositivo: json['nombreDispositivo'] as String?,
      codigoDispositivo: json['codigoDispositivo'] as String?,
    );

Map<String, dynamic> _$$ModeloPruebaImplToJson(_$ModeloPruebaImpl instance) =>
    <String, dynamic>{
      'numSucursal': instance.numSucursal,
      'nombreSucursal': instance.nombreSucursal,
      'nombreDispositivo': instance.nombreDispositivo,
      'codigoDispositivo': instance.codigoDispositivo,
    };
