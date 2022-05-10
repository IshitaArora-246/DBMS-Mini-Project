import 'package:employeemanagementsystem/data/department_table_source.dart';
import 'package:employeemanagementsystem/main.dart';
import 'package:employeemanagementsystem/models/department/department.dart';
import 'package:employeemanagementsystem/views/departments/providers/dept_provider.dart';
import 'package:employeemanagementsystem/widgets/scroll_up_button.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DepartmentListPage extends ConsumerStatefulWidget {
  const DepartmentListPage({Key? key}) : super(key: key);

  @override
  _DepartmentListPageState createState() => _DepartmentListPageState();
}

class _DepartmentListPageState extends ConsumerState<DepartmentListPage> {
  List<Department> filteredDeptList = [];
  List<Department> deptsList = [];
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var itemNotifier = ref.watch(dept_repository_provider);

    return itemNotifier.when(
        data: (data) => _onDataLoaded(data),
        error: (error, stackTrace) =>
            const Center(child: Text('Some error Occured!')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  Widget _onDataLoaded(List<Department> data) {
    deptsList = data;

    logger.d("dept list Length: ${deptsList.length}");

    if (filteredDeptList.isEmpty && deptsList.isNotEmpty) {
      filteredDeptList = deptsList;
    }

    if (deptsList.isEmpty) {
      return const Center(
        child: Text("No Items"),
      );
    }

    return Scaffold(
      backgroundColor: Colors.yellow[50],
      floatingActionButton: InkWell(
        onTap: () {
         
        },
        child: Container(
          height: 45,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber.shade800,
          ),
          child: const Center(
              child: Text(
            "+ Add Department",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          )),
        ),
      ),
      body: Consumer(
        builder: (_, instance, __) {
          return Column(
            children: [
              const Text(
                "Departments",
                style: TextStyle(
                  height: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Theme(
                  data:
                      Theme.of(context).copyWith(cardColor: Colors.yellow[50]),
                  child: Stack(
                    children: [
                      PaginatedDataTable2(
                        scrollController: _controller,
                        rowsPerPage: 20,
                        source: DepartmentTableData(
                          context: context,
                          filteredDeptList: filteredDeptList,
                        ),
                        columnSpacing: 12,
                        horizontalMargin: 52,
                        sortColumnIndex: 1,
                        minWidth: 100,
                        columns: const [
                          DataColumn2(
                            label: Text(
                              'Id',
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            size: ColumnSize.S,
                          ),
                          DataColumn2(
                            label: Text(
                              'Name',
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            size: ColumnSize.L,
                          ),
                        ],
                      ),
                      ScrollUpButton(_controller)
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
