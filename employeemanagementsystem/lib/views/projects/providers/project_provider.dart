// ignore_for_file: non_constant_identifier_names
import 'package:employeemanagementsystem/apiHelper.dart';
import 'package:employeemanagementsystem/models/project/project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final project_repository_provider =
    StateNotifierProvider<Projects, AsyncValue<List<Project>>>((ref) {
  return Projects(
    read: ref.read,
  );
});

class Projects extends StateNotifier<AsyncValue<List<Project>>> {
  final Reader read;

  Projects({
    required this.read,
  }) : super(
          const AsyncLoading(),
        ) {
    _initDB();
  }

  Future<void> _initDB() async {
    List<Project> projs = await _fetchProjects();
    state = AsyncData(projs);
  }

  Future<void> refresh() async {
    List<Project> projs = await _fetchProjects();
    state = AsyncData(projs);
  }

  _fetchProjects() async {
    final responseJson =
        await ApiHelper.getRequest('projects');

    final List _projsRaw = responseJson;
    final _projects = _projsRaw.map((e) => Project.fromJson(e)).toList();

    return _projects;
  }

  
  // _addProject() async {
  //   final responseJson =
  //       await ApiHelper.getRequest('add_Project');

  //   final response = responseJson;
  //   refresh();
  //   return response;
  // }
}
