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
  String? get nombre => throw _privateConstructorUsedError;
  String? get etiqueta => throw _privateConstructorUsedError;
  String? get codigo => throw _privateConstructorUsedError;
  bool? get enUso => throw _privateConstructorUsedError;
  String? get estatus => throw _privateConstructorUsedError;
  String? get observaciones => throw _privateConstructorUsedError;

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
      {String? nombre,
      String? etiqueta,
      String? codigo,
      bool? enUso,
      String? estatus,
      String? observaciones});
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
    Object? nombre = freezed,
    Object? etiqueta = freezed,
    Object? codigo = freezed,
    Object? enUso = freezed,
    Object? estatus = freezed,
    Object? observaciones = freezed,
  }) {
    return _then(_value.copyWith(
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
      etiqueta: freezed == etiqueta
          ? _value.etiqueta
          : etiqueta // ignore: cast_nullable_to_non_nullable
              as String?,
      codigo: freezed == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String?,
      enUso: freezed == enUso
          ? _value.enUso
          : enUso // ignore: cast_nullable_to_non_nullable
              as bool?,
      estatus: freezed == estatus
          ? _value.estatus
          : estatus // ignore: cast_nullable_to_non_nullable
              as String?,
      observaciones: freezed == observaciones
          ? _value.observaciones
          : observaciones // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {String? nombre,
      String? etiqueta,
      String? codigo,
      bool? enUso,
      String? estatus,
      String? observaciones});
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
    Object? nombre = freezed,
    Object? etiqueta = freezed,
    Object? codigo = freezed,
    Object? enUso = freezed,
    Object? estatus = freezed,
    Object? observaciones = freezed,
  }) {
    return _then(_$DispositivoImpl(
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
      etiqueta: freezed == etiqueta
          ? _value.etiqueta
          : etiqueta // ignore: cast_nullable_to_non_nullable
              as String?,
      codigo: freezed == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String?,
      enUso: freezed == enUso
          ? _value.enUso
          : enUso // ignore: cast_nullable_to_non_nullable
              as bool?,
      estatus: freezed == estatus
          ? _value.estatus
          : estatus // ignore: cast_nullable_to_non_nullable
              as String?,
      observaciones: freezed == observaciones
          ? _value.observaciones
          : observaciones // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DispositivoImpl with DiagnosticableTreeMixin implements _Dispositivo {
  const _$DispositivoImpl(
      {required this.nombre,
      required this.etiqueta,
      required this.codigo,
      required this.enUso,
      required this.estatus,
      required this.observaciones});

  factory _$DispositivoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DispositivoImplFromJson(json);

  @override
  final String? nombre;
  @override
  final String? etiqueta;
  @override
  final String? codigo;
  @override
  final bool? enUso;
  @override
  final String? estatus;
  @override
  final String? observaciones;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Dispositivo(nombre: $nombre, etiqueta: $etiqueta, codigo: $codigo, enUso: $enUso, estatus: $estatus, observaciones: $observaciones)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Dispositivo'))
      ..add(DiagnosticsProperty('nombre', nombre))
      ..add(DiagnosticsProperty('etiqueta', etiqueta))
      ..add(DiagnosticsProperty('codigo', codigo))
      ..add(DiagnosticsProperty('enUso', enUso))
      ..add(DiagnosticsProperty('estatus', estatus))
      ..add(DiagnosticsProperty('observaciones', observaciones));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispositivoImpl &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.etiqueta, etiqueta) ||
                other.etiqueta == etiqueta) &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.enUso, enUso) || other.enUso == enUso) &&
            (identical(other.estatus, estatus) || other.estatus == estatus) &&
            (identical(other.observaciones, observaciones) ||
                other.observaciones == observaciones));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, nombre, etiqueta, codigo, enUso, estatus, observaciones);

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
}

abstract class _Dispositivo implements Dispositivo {
  const factory _Dispositivo(
      {required final String? nombre,
      required final String? etiqueta,
      required final String? codigo,
      required final bool? enUso,
      required final String? estatus,
      required final String? observaciones}) = _$DispositivoImpl;

  factory _Dispositivo.fromJson(Map<String, dynamic> json) =
      _$DispositivoImpl.fromJson;

  @override
  String? get nombre;
  @override
  String? get etiqueta;
  @override
  String? get codigo;
  @override
  bool? get enUso;
  @override
  String? get estatus;
  @override
  String? get observaciones;
  @override
  @JsonKey(ignore: true)
  _$$DispositivoImplCopyWith<_$DispositivoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
