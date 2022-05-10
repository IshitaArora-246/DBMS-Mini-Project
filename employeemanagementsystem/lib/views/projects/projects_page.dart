import 'package:employeemanagementsystem/data/project_table_source.dart';
import 'package:employeemanagementsystem/main.dart';
import 'package:employeemanagementsystem/models/project/project.dart';
import 'package:employeemanagementsystem/views/projects/providers/project_provider.dart';
import 'package:employeemanagementsystem/widgets/scroll_up_button.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectListPage extends ConsumerStatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends ConsumerState<ProjectListPage> {
  List<Project> filteredProjList = [];
  List<Project> projsList = [];
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var itemNotifier = ref.watch(project_repository_provider);

    return itemNotifier.when(
        data: (data) => _onDataLoaded(data),
        error: (error, stackTrace) =>
            const Center(child: Text('Some error Occured!')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  Widget _onDataLoaded(List<Project> data) {
    projsList = data;

    logger.d("proj list Length: ${projsList.length}");

    if (filteredProjList.isEmpty && projsList.isNotEmpty) {
      filteredProjList = projsList;
    }

    if (projsList.isEmpty) {
      return const Center(
        child: Text("No Items"),
      );
    }

    return Scaffold(
      backgroundColor: Colors.yellow[50],
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          height: 45,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber.shade800,
          ),
          child: const Center(
              child: Text(
            "+ Add Project",
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
                "Projects",
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
                        source: ProjectTableData(
                          context: context,
                          filteredProjList: filteredProjList,
                        ),
                        columnSpacing: 12,
                        horizontalMargin: 52,
                        sortColumnIndex: 1,
                        minWidth: 100,
                        columns: const [
                          DataColumn2(
                            label: Text('Project Id'),
                            size: ColumnSize.S,
                          ),
                          DataColumn2(
                            label: Text('Project Name'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('Location'),
                            size: ColumnSize.M,
                          ),
                          DataColumn2(
                            label: Text('Dept. Id'),
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
