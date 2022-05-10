import 'package:employeemanagementsystem/models/employee_info/employee_info.dart';
import 'package:flutter/material.dart';

class EmployeeInfoTableData extends DataTableSource {
  BuildContext context;
  List<EmployeeInfo> filteredEmpList;
  EmployeeInfoTableData({required this.context, required this.filteredEmpList});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => filteredEmpList.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    EmployeeInfo _emp = filteredEmpList[index];

    return DataRow(cells: [
      buildDataCell(
        context,
        '#${_emp.emp_id}',
        width: 50,
        onTap: () {},
      ),
      buildDataCell(
        context,
        _emp.fname,
        width: 320,
        onTap: () {},
      ),
      buildDataCell(
        context,
        _emp.mname,
        width: 50,
        onTap: () {},
      ),
      buildDataCell(
        context,
        _emp.lname,
        width: 320,
        onTap: () {},
      ),
      buildDataCell(
        context,
        _emp.gender,
        width: 50,
        onTap: () {},
      ),
      buildDataCell(
        context,
        _emp.dob.toString().split(" ").first,
        width: 320,
        onTap: () {},
      ),
      buildDataCell(
        context,
        _emp.doj.toString().split(" ").first,
        width: 50,
        onTap: () {},
      ),
      buildDataCell(
        context,
        "\u{20B9} ${_emp.emp_salary.toString()}",
        width: 320,
        onTap: () {},
      ),
      buildDataCell(
        context,
        _emp.emp_email,
        width: 150,
        onTap: () {},
      ),
      buildDataCell(
        context,
        _emp.emp_phone.toString(),
        width: 320,
        onTap: () {},
      ),
    ]);
  }

  DataCell buildDataCell(BuildContext context, String content,
      {EmployeeInfo? question, Function()? onTap, double? width = 70}) {
    return DataCell(
      SizedBox(
        width: width,
        child: Text(
          content,
          style: const TextStyle(fontSize: 12),
        ),
      ),
      onTap: onTap,
    );
  }
}
