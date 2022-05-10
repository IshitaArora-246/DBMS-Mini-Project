// ignore_for_file: non_constant_identifier_names

import 'package:employeemanagementsystem/apiHelper.dart';
import 'package:employeemanagementsystem/models/department/department.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dept_repository_provider =
    StateNotifierProvider<Departments, AsyncValue<List<Department>>>((ref) {
  return Departments(
    read: ref.read,
  );
});

class Departments extends StateNotifier<AsyncValue<List<Department>>> {
  final Reader read;

  Departments({
    required this.read,
  }) : super(
          const AsyncLoading(),
        ) {
    _initDB();
  }

  Future<void> _initDB() async {
    List<Department> depts = await _fetchDepartment();
    state = AsyncData(depts);
  }

  Future<void> refresh() async {
    List<Department> depts = await _fetchDepartment();
    state = AsyncData(depts);
  }

  _fetchDepartment() async {
    final responseJson = await ApiHelper.getRequest('departments');

    final List _deptsRaw = responseJson;
    final _depts = _deptsRaw.map((e) => Department.fromJson(e)).toList();

    return _depts;
  }

  // _addDepartment() async {
  //   final responseJson =
  //       await ApiHelper.getRequest('add_department');

  //   final response = responseJson;
  //   refresh();
  //   return response;
  // }
}
