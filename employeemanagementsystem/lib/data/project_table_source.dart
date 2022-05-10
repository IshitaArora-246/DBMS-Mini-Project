import 'package:employeemanagementsystem/models/project/project.dart';
import 'package:flutter/material.dart';

class ProjectTableData extends DataTableSource {
  // Generate some made-up data

  BuildContext context;
  List<Project> filteredProjList;
  ProjectTableData({required this.context, required this.filteredProjList});

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => filteredProjList.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    Project _proj = filteredProjList[index];

    return DataRow(cells: [
      //Project Id
      buildDataCell(
        context,
        '#${_proj.project_id}',
        width: 80,
      ),
      //Project Name
      buildDataCell(
        context,
        _proj.proj_name,
        width: 320,
      ),
      buildDataCell(
        context,
        _proj.location,
        width: 320,
      ),
      //Project Name
      buildDataCell(
        context,
        '#${_proj.dept_id}',
        width: 320,
      ),
    ]);
  }

  DataCell buildDataCell(BuildContext context, String content,
      {Project? question, double? width = 70}) {
    return DataCell(
      SizedBox(
        width: width,
        child: Text(
          content,
        ),
      ),
    );
  }
}
