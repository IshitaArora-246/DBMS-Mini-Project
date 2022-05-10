// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'department.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Department _$DepartmentFromJson(Map<String, dynamic> json) {
  return _Department.fromJson(json);
}

/// @nodoc
class _$DepartmentTearOff {
  const _$DepartmentTearOff();

  _Department call({required int dept_id, required String dept_name}) {
    return _Department(
      dept_id: dept_id,
      dept_name: dept_name,
    );
  }

  Department fromJson(Map<String, Object?> json) {
    return Department.fromJson(json);
  }
}

/// @nodoc
const $Department = _$DepartmentTearOff();

/// @nodoc
mixin _$Department {
  int get dept_id => throw _privateConstructorUsedError;
  String get dept_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepartmentCopyWith<Department> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentCopyWith<$Res> {
  factory $DepartmentCopyWith(
          Department value, $Res Function(Department) then) =
      _$DepartmentCopyWithImpl<$Res>;
  $Res call({int dept_id, String dept_name});
}

/// @nodoc
class _$DepartmentCopyWithImpl<$Res> implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._value, this._then);

  final Department _value;
  // ignore: unused_field
  final $Res Function(Department) _then;

  @override
  $Res call({
    Object? dept_id = freezed,
    Object? dept_name = freezed,
  }) {
    return _then(_value.copyWith(
      dept_id: dept_id == freezed
          ? _value.dept_id
          : dept_id // ignore: cast_nullable_to_non_nullable
              as int,
      dept_name: dept_name == freezed
          ? _value.dept_name
          : dept_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DepartmentCopyWith<$Res> implements $DepartmentCopyWith<$Res> {
  factory _$DepartmentCopyWith(
          _Department value, $Res Function(_Department) then) =
      __$DepartmentCopyWithImpl<$Res>;
  @override
  $Res call({int dept_id, String dept_name});
}

/// @nodoc
class __$DepartmentCopyWithImpl<$Res> extends _$DepartmentCopyWithImpl<$Res>
    implements _$DepartmentCopyWith<$Res> {
  __$DepartmentCopyWithImpl(
      _Department _value, $Res Function(_Department) _then)
      : super(_value, (v) => _then(v as _Department));

  @override
  _Department get _value => super._value as _Department;

  @override
  $Res call({
    Object? dept_id = freezed,
    Object? dept_name = freezed,
  }) {
    return _then(_Department(
      dept_id: dept_id == freezed
          ? _value.dept_id
          : dept_id // ignore: cast_nullable_to_non_nullable
              as int,
      dept_name: dept_name == freezed
          ? _value.dept_name
          : dept_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Department extends _Department {
  const _$_Department({required this.dept_id, required this.dept_name})
      : super._();

  factory _$_Department.fromJson(Map<String, dynamic> json) =>
      _$$_DepartmentFromJson(json);

  @override
  final int dept_id;
  @override
  final String dept_name;

  @override
  String toString() {
    return 'Department(dept_id: $dept_id, dept_name: $dept_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Department &&
            const DeepCollectionEquality().equals(other.dept_id, dept_id) &&
            const DeepCollectionEquality().equals(other.dept_name, dept_name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dept_id),
      const DeepCollectionEquality().hash(dept_name));

  @JsonKey(ignore: true)
  @override
  _$DepartmentCopyWith<_Department> get copyWith =>
      __$DepartmentCopyWithImpl<_Department>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DepartmentToJson(this);
  }
}

abstract class _Department extends Department {
  const factory _Department({required int dept_id, required String dept_name}) =
      _$_Department;
  const _Department._() : super._();

  factory _Department.fromJson(Map<String, dynamic> json) =
      _$_Department.fromJson;

  @override
  int get dept_id;
  @override
  String get dept_name;
  @override
  @JsonKey(ignore: true)
  _$DepartmentCopyWith<_Department> get copyWith =>
      throw _privateConstructorUsedError;
}
