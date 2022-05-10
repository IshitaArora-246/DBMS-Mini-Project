// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_info.freezed.dart';
part 'employee_info.g.dart';

@freezed
class EmployeeInfo with _$EmployeeInfo {
  const EmployeeInfo._();

  const factory EmployeeInfo({
    required int emp_id,
    required String fname,
    required String mname,
    required String lname,
    required String gender,
    required String dob,
    required String doj,
    required int emp_salary,
    required String emp_email,
    required String emp_phone,
  }) = _EmployeeInfo;

  factory EmployeeInfo.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoFromJson(json);
}
