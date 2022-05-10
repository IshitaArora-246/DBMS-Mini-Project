// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
class _$ProjectTearOff {
  const _$ProjectTearOff();

  _Project call(
      {required int project_id,
      required String proj_name,
      required String location,
      required int dept_id}) {
    return _Project(
      project_id: project_id,
      proj_name: proj_name,
      location: location,
      dept_id: dept_id,
    );
  }

  Project fromJson(Map<String, Object?> json) {
    return Project.fromJson(json);
  }
}

/// @nodoc
const $Project = _$ProjectTearOff();

/// @nodoc
mixin _$Project {
  int get project_id => throw _privateConstructorUsedError;
  String get proj_name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get dept_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call({int project_id, String proj_name, String location, int dept_id});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

  @override
  $Res call({
    Object? project_id = freezed,
    Object? proj_name = freezed,
    Object? location = freezed,
    Object? dept_id = freezed,
  }) {
    return _then(_value.copyWith(
      project_id: project_id == freezed
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      proj_name: proj_name == freezed
          ? _value.proj_name
          : proj_name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      dept_id: dept_id == freezed
          ? _value.dept_id
          : dept_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) then) =
      __$ProjectCopyWithImpl<$Res>;
  @override
  $Res call({int project_id, String proj_name, String location, int dept_id});
}

/// @nodoc
class __$ProjectCopyWithImpl<$Res> extends _$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(_Project _value, $Res Function(_Project) _then)
      : super(_value, (v) => _then(v as _Project));

  @override
  _Project get _value => super._value as _Project;

  @override
  $Res call({
    Object? project_id = freezed,
    Object? proj_name = freezed,
    Object? location = freezed,
    Object? dept_id = freezed,
  }) {
    return _then(_Project(
      project_id: project_id == freezed
          ? _value.project_id
          : project_id // ignore: cast_nullable_to_non_nullable
              as int,
      proj_name: proj_name == freezed
          ? _value.proj_name
          : proj_name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      dept_id: dept_id == freezed
          ? _value.dept_id
          : dept_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project extends _Project {
  const _$_Project(
      {required this.project_id,
      required this.proj_name,
      required this.location,
      required this.dept_id})
      : super._();

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectFromJson(json);

  @override
  final int project_id;
  @override
  final String proj_name;
  @override
  final String location;
  @override
  final int dept_id;

  @override
  String toString() {
    return 'Project(project_id: $project_id, proj_name: $proj_name, location: $location, dept_id: $dept_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Project &&
            const DeepCollectionEquality()
                .equals(other.project_id, project_id) &&
            const DeepCollectionEquality().equals(other.proj_name, proj_name) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.dept_id, dept_id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(project_id),
      const DeepCollectionEquality().hash(proj_name),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(dept_id));

  @JsonKey(ignore: true)
  @override
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectToJson(this);
  }
}

abstract class _Project extends Project {
  const factory _Project(
      {required int project_id,
      required String proj_name,
      required String location,
      required int dept_id}) = _$_Project;
  const _Project._() : super._();

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  int get project_id;
  @override
  String get proj_name;
  @override
  String get location;
  @override
  int get dept_id;
  @override
  @JsonKey(ignore: true)
  _$ProjectCopyWith<_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
