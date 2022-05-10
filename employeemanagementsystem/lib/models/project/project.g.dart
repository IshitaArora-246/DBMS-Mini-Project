// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      project_id: json['project_id'] as int,
      proj_name: json['proj_name'] as String,
      location: json['location'] as String,
      dept_id: json['dept_id'] as int,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'project_id': instance.project_id,
      'proj_name': instance.proj_name,
      'location': instance.location,
      'dept_id': instance.dept_id,
    };
