import 'package:employeemanagementsystem/views/departments/depts_page.dart';
import 'package:employeemanagementsystem/views/employee_info/emps_page.dart';
import 'package:employeemanagementsystem/views/projects/projects_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber.shade600,
            bottom: const TabBar(
              tabs: [
                Tab(
                    child: Text(
                  "Employees",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                Tab(
                    child: Text(
                  "Departments",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
                Tab(
                    child: Text(
                  "Projects",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ],
            ),
            title: const Text('Aditya Birla Group'),
          ),
          body: const TabBarView(
            children: [
              EmployeeListPage(),
              DepartmentListPage(),
              ProjectListPage(),
            ],
          ),
        ),
      ),
    );
  }
}
