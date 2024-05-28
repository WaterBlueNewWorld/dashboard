// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sucursal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Sucursal _$SucursalFromJson(Map<String, dynamic> json) {
  return _Sucursal.fromJson(json);
}

/// @nodoc
mixin _$Sucursal {
  String? get nombre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SucursalCopyWith<Sucursal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SucursalCopyWith<$Res> {
  factory $SucursalCopyWith(Sucursal value, $Res Function(Sucursal) then) =
      _$SucursalCopyWithImpl<$Res, Sucursal>;
  @useResult
  $Res call({String? nombre});
}

/// @nodoc
class _$SucursalCopyWithImpl<$Res, $Val extends Sucursal>
    implements $SucursalCopyWith<$Res> {
  _$SucursalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = freezed,
  }) {
    return _then(_value.copyWith(
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SucursalImplCopyWith<$Res>
    implements $SucursalCopyWith<$Res> {
  factory _$$SucursalImplCopyWith(
          _$SucursalImpl value, $Res Function(_$SucursalImpl) then) =
      __$$SucursalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nombre});
}

/// @nodoc
class __$$SucursalImplCopyWithImpl<$Res>
    extends _$SucursalCopyWithImpl<$Res, _$SucursalImpl>
    implements _$$SucursalImplCopyWith<$Res> {
  __$$SucursalImplCopyWithImpl(
      _$SucursalImpl _value, $Res Function(_$SucursalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = freezed,
  }) {
    return _then(_$SucursalImpl(
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SucursalImpl with DiagnosticableTreeMixin implements _Sucursal {
  const _$SucursalImpl({required this.nombre});

  factory _$SucursalImpl.fromJson(Map<String, dynamic> json) =>
      _$$SucursalImplFromJson(json);

  @override
  final String? nombre;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Sucursal(nombre: $nombre)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Sucursal'))
      ..add(DiagnosticsProperty('nombre', nombre));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SucursalImpl &&
            (identical(other.nombre, nombre) || other.nombre == nombre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nombre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SucursalImplCopyWith<_$SucursalImpl> get copyWith =>
      __$$SucursalImplCopyWithImpl<_$SucursalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SucursalImplToJson(
      this,
    );
  }
}

abstract class _Sucursal implements Sucursal {
  const factory _Sucursal({required final String? nombre}) = _$SucursalImpl;

  factory _Sucursal.fromJson(Map<String, dynamic> json) =
      _$SucursalImpl.fromJson;

  @override
  String? get nombre;
  @override
  @JsonKey(ignore: true)
  _$$SucursalImplCopyWith<_$SucursalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
