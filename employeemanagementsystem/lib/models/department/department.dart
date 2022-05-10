// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'department.freezed.dart';
part 'department.g.dart';

@freezed
class Department with _$Department {
  const Department._();

  const factory Department({
    required int dept_id,
    required String dept_name,
   
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
}
