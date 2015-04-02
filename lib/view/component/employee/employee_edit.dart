import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'employee_table.dart';

@CustomTag('employee-edit')
class EmployeeEdit extends PolymerElement {
  @published Employees employees;
  @published Employee employee;

  EmployeeEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    var polymerApp = querySelector('#polymer-app');
    EmployeeTable employeeTable =
        polymerApp.shadowRoot.querySelector('#employee-table');
    employeeTable.showEdit = false;
    polymerApp.saveData();
    window.location.reload();
  }
}