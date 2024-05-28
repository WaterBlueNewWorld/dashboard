// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modelo_prueba.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModeloPrueba _$ModeloPruebaFromJson(Map<String, dynamic> json) {
  return _ModeloPrueba.fromJson(json);
}

/// @nodoc
mixin _$ModeloPrueba {
  int? get numSucursal => throw _privateConstructorUsedError;
  String? get nombreSucursal => throw _privateConstructorUsedError;
  String? get nombreDispositivo => throw _privateConstructorUsedError;
  String? get codigoDispositivo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModeloPruebaCopyWith<ModeloPrueba> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModeloPruebaCopyWith<$Res> {
  factory $ModeloPruebaCopyWith(
          ModeloPrueba value, $Res Function(ModeloPrueba) then) =
      _$ModeloPruebaCopyWithImpl<$Res, ModeloPrueba>;
  @useResult
  $Res call(
      {int? numSucursal,
      String? nombreSucursal,
      String? nombreDispositivo,
      String? codigoDispositivo});
}

/// @nodoc
class _$ModeloPruebaCopyWithImpl<$Res, $Val extends ModeloPrueba>
    implements $ModeloPruebaCopyWith<$Res> {
  _$ModeloPruebaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numSucursal = freezed,
    Object? nombreSucursal = freezed,
    Object? nombreDispositivo = freezed,
    Object? codigoDispositivo = freezed,
  }) {
    return _then(_value.copyWith(
      numSucursal: freezed == numSucursal
          ? _value.numSucursal
          : numSucursal // ignore: cast_nullable_to_non_nullable
              as int?,
      nombreSucursal: freezed == nombreSucursal
          ? _value.nombreSucursal
          : nombreSucursal // ignore: cast_nullable_to_non_nullable
              as String?,
      nombreDispositivo: freezed == nombreDispositivo
          ? _value.nombreDispositivo
          : nombreDispositivo // ignore: cast_nullable_to_non_nullable
              as String?,
      codigoDispositivo: freezed == codigoDispositivo
          ? _value.codigoDispositivo
          : codigoDispositivo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModeloPruebaImplCopyWith<$Res>
    implements $ModeloPruebaCopyWith<$Res> {
  factory _$$ModeloPruebaImplCopyWith(
          _$ModeloPruebaImpl value, $Res Function(_$ModeloPruebaImpl) then) =
      __$$ModeloPruebaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? numSucursal,
      String? nombreSucursal,
      String? nombreDispositivo,
      String? codigoDispositivo});
}

/// @nodoc
class __$$ModeloPruebaImplCopyWithImpl<$Res>
    extends _$ModeloPruebaCopyWithImpl<$Res, _$ModeloPruebaImpl>
    implements _$$ModeloPruebaImplCopyWith<$Res> {
  __$$ModeloPruebaImplCopyWithImpl(
      _$ModeloPruebaImpl _value, $Res Function(_$ModeloPruebaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numSucursal = freezed,
    Object? nombreSucursal = freezed,
    Object? nombreDispositivo = freezed,
    Object? codigoDispositivo = freezed,
  }) {
    return _then(_$ModeloPruebaImpl(
      numSucursal: freezed == numSucursal
          ? _value.numSucursal
          : numSucursal // ignore: cast_nullable_to_non_nullable
              as int?,
      nombreSucursal: freezed == nombreSucursal
          ? _value.nombreSucursal
          : nombreSucursal // ignore: cast_nullable_to_non_nullable
              as String?,
      nombreDispositivo: freezed == nombreDispositivo
          ? _value.nombreDispositivo
          : nombreDispositivo // ignore: cast_nullable_to_non_nullable
              as String?,
      codigoDispositivo: freezed == codigoDispositivo
          ? _value.codigoDispositivo
          : codigoDispositivo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModeloPruebaImpl with DiagnosticableTreeMixin implements _ModeloPrueba {
  const _$ModeloPruebaImpl(
      {required this.numSucursal,
      required this.nombreSucursal,
      required this.nombreDispositivo,
      required this.codigoDispositivo});

  factory _$ModeloPruebaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModeloPruebaImplFromJson(json);

  @override
  final int? numSucursal;
  @override
  final String? nombreSucursal;
  @override
  final String? nombreDispositivo;
  @override
  final String? codigoDispositivo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ModeloPrueba(numSucursal: $numSucursal, nombreSucursal: $nombreSucursal, nombreDispositivo: $nombreDispositivo, codigoDispositivo: $codigoDispositivo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ModeloPrueba'))
      ..add(DiagnosticsProperty('numSucursal', numSucursal))
      ..add(DiagnosticsProperty('nombreSucursal', nombreSucursal))
      ..add(DiagnosticsProperty('nombreDispositivo', nombreDispositivo))
      ..add(DiagnosticsProperty('codigoDispositivo', codigoDispositivo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModeloPruebaImpl &&
            (identical(other.numSucursal, numSucursal) ||
                other.numSucursal == numSucursal) &&
            (identical(other.nombreSucursal, nombreSucursal) ||
                other.nombreSucursal == nombreSucursal) &&
            (identical(other.nombreDispositivo, nombreDispositivo) ||
                other.nombreDispositivo == nombreDispositivo) &&
            (identical(other.codigoDispositivo, codigoDispositivo) ||
                other.codigoDispositivo == codigoDispositivo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, numSucursal, nombreSucursal,
      nombreDispositivo, codigoDispositivo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModeloPruebaImplCopyWith<_$ModeloPruebaImpl> get copyWith =>
      __$$ModeloPruebaImplCopyWithImpl<_$ModeloPruebaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModeloPruebaImplToJson(
      this,
    );
  }
}

abstract class _ModeloPrueba implements ModeloPrueba {
  const factory _ModeloPrueba(
      {required final int? numSucursal,
      required final String? nombreSucursal,
      required final String? nombreDispositivo,
      required final String? codigoDispositivo}) = _$ModeloPruebaImpl;

  factory _ModeloPrueba.fromJson(Map<String, dynamic> json) =
      _$ModeloPruebaImpl.fromJson;

  @override
  int? get numSucursal;
  @override
  String? get nombreSucursal;
  @override
  String? get nombreDispositivo;
  @override
  String? get codigoDispositivo;
  @override
  @JsonKey(ignore: true)
  _$$ModeloPruebaImplCopyWith<_$ModeloPruebaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
