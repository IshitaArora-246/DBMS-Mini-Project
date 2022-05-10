import 'package:employeemanagementsystem/models/department/department.dart';
import 'package:flutter/material.dart';

class DepartmentTableData extends DataTableSource {
  // Generate some made-up data

  BuildContext context;
  List<Department> filteredDeptList;
  DepartmentTableData({required this.context, required this.filteredDeptList});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => filteredDeptList.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    Department _dept = filteredDeptList[index];

    return DataRow(cells: [
      //Department Id
      buildDataCell(
        context,
        '#${_dept.dept_id}',
        width: 50,
        onTap: () {},
      ),
      //Department Name
      buildDataCell(
        context,
        _dept.dept_name,
        width: 320,
        onTap: () {},
      ),
    ]);
  }

  DataCell buildDataCell(BuildContext context, String content,
      {Department? question, Function()? onTap, double? width = 70}) {
    return DataCell(
      SizedBox(
        width: width,
        child: Text(
          content,
        ),
      ),
      onTap: onTap,
    );
  }
}
