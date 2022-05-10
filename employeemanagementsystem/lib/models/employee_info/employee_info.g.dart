// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'employee_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeInfo _$$_EmployeeInfoFromJson(Map<String, dynamic> json) =>
    _$_EmployeeInfo(
      emp_id: json['emp_id'] as int,
      fname: json['fname'] as String,
      mname: json['mname'] as String,
      lname: json['lname'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      doj: json['doj'] as String,
      emp_salary: json['emp_salary'] as int,
      emp_email: json['emp_email'] as String,
      emp_phone: json['emp_phone'] as String,
    );

Map<String, dynamic> _$$_EmployeeInfoToJson(_$_EmployeeInfo instance) =>
    <String, dynamic>{
      'emp_id': instance.emp_id,
      'fname': instance.fname,
      'mname': instance.mname,
      'lname': instance.lname,
      'gender': instance.gender,
      'dob': instance.dob,
      'doj': instance.doj,
      'emp_salary': instance.emp_salary,
      'emp_email': instance.emp_email,
      'emp_phone': instance.emp_phone,
    };
