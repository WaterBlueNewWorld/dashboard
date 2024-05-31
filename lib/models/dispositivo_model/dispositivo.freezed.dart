// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispositivo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dispositivo _$DispositivoFromJson(Map<String, dynamic> json) {
  return _Dispositivo.fromJson(json);
}

/// @nodoc
mixin _$Dispositivo {
  String? get idInventario => throw _privateConstructorUsedError;
  String? get nombre => throw _privateConstructorUsedError;
  String? get etiqueta => throw _privateConstructorUsedError;
  int get numInventario => throw _privateConstructorUsedError;
  bool? get enUso => throw _privateConstructorUsedError;
  Estatus get estatus => throw _privateConstructorUsedError;
  Tipo get tipo => throw _privateConstructorUsedError;
  String? get observaciones => throw _privateConstructorUsedError;
  String? get ip => throw _privateConstructorUsedError;
  Sucursal get sucursal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DispositivoCopyWith<Dispositivo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DispositivoCopyWith<$Res> {
  factory $DispositivoCopyWith(
          Dispositivo value, $Res Function(Dispositivo) then) =
      _$DispositivoCopyWithImpl<$Res, Dispositivo>;
  @useResult
  $Res call(
      {String? idInventario,
      String? nombre,
      String? etiqueta,
      int numInventario,
      bool? enUso,
      Estatus estatus,
      Tipo tipo,
      String? observaciones,
      String? ip,
      Sucursal sucursal});

  $SucursalCopyWith<$Res> get sucursal;
}

/// @nodoc
class _$DispositivoCopyWithImpl<$Res, $Val extends Dispositivo>
    implements $DispositivoCopyWith<$Res> {
  _$DispositivoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idInventario = freezed,
    Object? nombre = freezed,
    Object? etiqueta = freezed,
    Object? numInventario = null,
    Object? enUso = freezed,
    Object? estatus = null,
    Object? tipo = null,
    Object? observaciones = freezed,
    Object? ip = freezed,
    Object? sucursal = null,
  }) {
    return _then(_value.copyWith(
      idInventario: freezed == idInventario
          ? _value.idInventario
          : idInventario // ignore: cast_nullable_to_non_nullable
              as String?,
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
      etiqueta: freezed == etiqueta
          ? _value.etiqueta
          : etiqueta // ignore: cast_nullable_to_non_nullable
              as String?,
      numInventario: null == numInventario
          ? _value.numInventario
          : numInventario // ignore: cast_nullable_to_non_nullable
              as int,
      enUso: freezed == enUso
          ? _value.enUso
          : enUso // ignore: cast_nullable_to_non_nullable
              as bool?,
      estatus: null == estatus
          ? _value.estatus
          : estatus // ignore: cast_nullable_to_non_nullable
              as Estatus,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as Tipo,
      observaciones: freezed == observaciones
          ? _value.observaciones
          : observaciones // ignore: cast_nullable_to_non_nullable
              as String?,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      sucursal: null == sucursal
          ? _value.sucursal
          : sucursal // ignore: cast_nullable_to_non_nullable
              as Sucursal,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SucursalCopyWith<$Res> get sucursal {
    return $SucursalCopyWith<$Res>(_value.sucursal, (value) {
      return _then(_value.copyWith(sucursal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DispositivoImplCopyWith<$Res>
    implements $DispositivoCopyWith<$Res> {
  factory _$$DispositivoImplCopyWith(
          _$DispositivoImpl value, $Res Function(_$DispositivoImpl) then) =
      __$$DispositivoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? idInventario,
      String? nombre,
      String? etiqueta,
      int numInventario,
      bool? enUso,
      Estatus estatus,
      Tipo tipo,
      String? observaciones,
      String? ip,
      Sucursal sucursal});

  @override
  $SucursalCopyWith<$Res> get sucursal;
}

/// @nodoc
class __$$DispositivoImplCopyWithImpl<$Res>
    extends _$DispositivoCopyWithImpl<$Res, _$DispositivoImpl>
    implements _$$DispositivoImplCopyWith<$Res> {
  __$$DispositivoImplCopyWithImpl(
      _$DispositivoImpl _value, $Res Function(_$DispositivoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idInventario = freezed,
    Object? nombre = freezed,
    Object? etiqueta = freezed,
    Object? numInventario = null,
    Object? enUso = freezed,
    Object? estatus = null,
    Object? tipo = null,
    Object? observaciones = freezed,
    Object? ip = freezed,
    Object? sucursal = null,
  }) {
    return _then(_$DispositivoImpl(
      idInventario: freezed == idInventario
          ? _value.idInventario
          : idInventario // ignore: cast_nullable_to_non_nullable
              as String?,
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
      etiqueta: freezed == etiqueta
          ? _value.etiqueta
          : etiqueta // ignore: cast_nullable_to_non_nullable
              as String?,
      numInventario: null == numInventario
          ? _value.numInventario
          : numInventario // ignore: cast_nullable_to_non_nullable
              as int,
      enUso: freezed == enUso
          ? _value.enUso
          : enUso // ignore: cast_nullable_to_non_nullable
              as bool?,
      estatus: null == estatus
          ? _value.estatus
          : estatus // ignore: cast_nullable_to_non_nullable
              as Estatus,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as Tipo,
      observaciones: freezed == observaciones
          ? _value.observaciones
          : observaciones // ignore: cast_nullable_to_non_nullable
              as String?,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      sucursal: null == sucursal
          ? _value.sucursal
          : sucursal // ignore: cast_nullable_to_non_nullable
              as Sucursal,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DispositivoImpl with DiagnosticableTreeMixin implements _Dispositivo {
  const _$DispositivoImpl(
      {required this.idInventario,
      required this.nombre,
      required this.etiqueta,
      required this.numInventario,
      required this.enUso,
      required this.estatus,
      required this.tipo,
      required this.observaciones,
      required this.ip,
      required this.sucursal});

  factory _$DispositivoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DispositivoImplFromJson(json);

  @override
  final String? idInventario;
  @override
  final String? nombre;
  @override
  final String? etiqueta;
  @override
  final int numInventario;
  @override
  final bool? enUso;
  @override
  final Estatus estatus;
  @override
  final Tipo tipo;
  @override
  final String? observaciones;
  @override
  final String? ip;
  @override
  final Sucursal sucursal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Dispositivo(idInventario: $idInventario, nombre: $nombre, etiqueta: $etiqueta, numInventario: $numInventario, enUso: $enUso, estatus: $estatus, tipo: $tipo, observaciones: $observaciones, ip: $ip, sucursal: $sucursal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Dispositivo'))
      ..add(DiagnosticsProperty('idInventario', idInventario))
      ..add(DiagnosticsProperty('nombre', nombre))
      ..add(DiagnosticsProperty('etiqueta', etiqueta))
      ..add(DiagnosticsProperty('numInventario', numInventario))
      ..add(DiagnosticsProperty('enUso', enUso))
      ..add(DiagnosticsProperty('estatus', estatus))
      ..add(DiagnosticsProperty('tipo', tipo))
      ..add(DiagnosticsProperty('observaciones', observaciones))
      ..add(DiagnosticsProperty('ip', ip))
      ..add(DiagnosticsProperty('sucursal', sucursal));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispositivoImpl &&
            (identical(other.idInventario, idInventario) ||
                other.idInventario == idInventario) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.etiqueta, etiqueta) ||
                other.etiqueta == etiqueta) &&
            (identical(other.numInventario, numInventario) ||
                other.numInventario == numInventario) &&
            (identical(other.enUso, enUso) || other.enUso == enUso) &&
            (identical(other.estatus, estatus) || other.estatus == estatus) &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.observaciones, observaciones) ||
                other.observaciones == observaciones) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.sucursal, sucursal) ||
                other.sucursal == sucursal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idInventario, nombre, etiqueta,
      numInventario, enUso, estatus, tipo, observaciones, ip, sucursal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DispositivoImplCopyWith<_$DispositivoImpl> get copyWith =>
      __$$DispositivoImplCopyWithImpl<_$DispositivoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DispositivoImplToJson(
      this,
    );
  }

  @override
  String toStringFormateada() {
    return
      "Nombre: $nombre \n"
      "Etiqueta: $etiqueta \n"
      "Estatus: ${estatus.nombre}";
  }
}

abstract class _Dispositivo implements Dispositivo {
  const factory _Dispositivo(
      {required final String? idInventario,
      required final String? nombre,
      required final String? etiqueta,
      required final int numInventario,
      required final bool? enUso,
      required final Estatus estatus,
      required final Tipo tipo,
      required final String? observaciones,
      required final String? ip,
      required final Sucursal sucursal}) = _$DispositivoImpl;

  factory _Dispositivo.fromJson(Map<String, dynamic> json) =
      _$DispositivoImpl.fromJson;

  @override
  String? get idInventario;
  @override
  String? get nombre;
  @override
  String? get etiqueta;
  @override
  int get numInventario;
  @override
  bool? get enUso;
  @override
  Estatus get estatus;
  @override
  Tipo get tipo;
  @override
  String? get observaciones;
  @override
  String? get ip;
  @override
  Sucursal get sucursal;
  @override
  @JsonKey(ignore: true)
  _$$DispositivoImplCopyWith<_$DispositivoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
