// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    required int project_id,
    required String proj_name,
    required String location,
    required int dept_id,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
