import 'package:employeemanagementsystem/data/employee_info_table_source.dart';
import 'package:employeemanagementsystem/main.dart';
import 'package:employeemanagementsystem/models/employee_info/employee_info.dart';
import 'package:employeemanagementsystem/views/employee_info/add_employee_form.dart';
import 'package:employeemanagementsystem/views/employee_info/providers/emp_info_provider.dart';
import 'package:employeemanagementsystem/widgets/scroll_up_button.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeeListPage extends ConsumerStatefulWidget {
  const EmployeeListPage({Key? key}) : super(key: key);

  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends ConsumerState<EmployeeListPage> {
  List<EmployeeInfo> filteredEmpList = [];
  List<EmployeeInfo> empsList = [];
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var itemNotifier = ref.watch(emp_info_repository_provider);

    return itemNotifier.when(
        data: (data) => _onDataLoaded(data),
        error: (error, stackTrace) =>
            const Center(child: Text('Some error Occured!')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  Widget _onDataLoaded(List<EmployeeInfo> data) {
    empsList = data;

    logger.d("emps list Length: ${empsList.length}");

    if (filteredEmpList.isEmpty && empsList.isNotEmpty) {
      filteredEmpList = empsList;
    }

    if (empsList.isEmpty) {
      return const Center(
        child: Text("No Items"),
      );
    }

    return Scaffold(
      backgroundColor: Colors.yellow[50],
      floatingActionButton: InkWell(
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddEditEmployeeForm(
                        employee: null,
                      )));
        },
        child: Container(
          height: 45,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber.shade800,
          ),
          child: const Center(
              child: Text(
            "+ Add Employee",
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
                "Employees",
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
                        source: EmployeeInfoTableData(
                          context: context,
                          filteredEmpList: filteredEmpList,
                        ),
                        columnSpacing: 12,
                        horizontalMargin: 52,
                        sortColumnIndex: 1,
                        minWidth: 100,
                        columns: const [
                          DataColumn2(
                            label: Text('Id'),
                            size: ColumnSize.S,
                          ),
                          DataColumn2(
                            label: Text('First Name'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('Middle Name'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('Last Name'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('Gender'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('Date of birth'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('Date of Joining'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('Salary'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('email'),
                            size: ColumnSize.L,
                          ),
                          DataColumn2(
                            label: Text('Phone No.'),
                            size: ColumnSize.M,
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
