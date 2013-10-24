import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('employee-edit')
class EmployeeEdit extends PolymerElement {
  @published Employees employees;
  @published Employee employee;
  @published String email;

  EmployeeEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    email = employee.email;
  }

  update(Event e, var detail, Node target) {
    employee.email = email;
    employees.order(); // to see a new email in the list
    var polymerApp = querySelector('#polymer-app');
    var employeeTable = polymerApp.shadowRoot.querySelector('#employee-table');
    employeeTable.showEdit = false;
  }
}