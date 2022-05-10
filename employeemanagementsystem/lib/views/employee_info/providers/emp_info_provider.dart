// ignore_for_file: non_constant_identifier_names

import 'package:employeemanagementsystem/apiHelper.dart';
import 'package:employeemanagementsystem/models/employee_info/employee_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emp_info_repository_provider =
    StateNotifierProvider<Employees, AsyncValue<List<EmployeeInfo>>>((ref) {
  return Employees(
    read: ref.read,
  );
});

class Employees extends StateNotifier<AsyncValue<List<EmployeeInfo>>> {
  final Reader read;

  Employees({
    required this.read,
  }) : super(
          const AsyncLoading(),
        ) {
    _initDB();
  }

  Future<void> _initDB() async {
    List<EmployeeInfo> emps = await _fetchEmployees();
    state = AsyncData(emps);
  }

  Future<void> refresh() async {
    List<EmployeeInfo> emps = await _fetchEmployees();
    state = AsyncData(emps);
  }

  _fetchEmployees() async {
    final responseJson = await ApiHelper.getRequest('employees');

    final List _empsRaw = responseJson;
    final _employees = _empsRaw.map((e) => EmployeeInfo.fromJson(e)).toList();

    return _employees;
  }

  addEmployeeInfo(Map<String, dynamic> empInfoJson) async {
    await ApiHelper.postRequest('add_Employee', body: empInfoJson);
    refresh();
  }
}
