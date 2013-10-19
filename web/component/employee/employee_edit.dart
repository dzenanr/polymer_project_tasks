import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('employee-edit')
class EmployeeEdit extends PolymerElement {
  @published Employees employees;
  @published Employee employee;
  @published String email;

  inserted() {
    super.inserted();
    email = employee.email;
  }

  update(Event e, var detail, Node target) {
    employee.email = email;
    employees.order(); // to see a new email in the list
    var polymerApp = query('#polymer-app');
    var employeeTable = polymerApp.shadowRoot.query('#employee-table').xtag;
    employeeTable.showEdit = false;
  }

  /*
  update() {
    InputElement email = query("#edit-employee-email");
    employee.email = email.value;
    var employeeTable = query('#employee-table').xtag;
    employeeTable.employees.order();
    employeeTable.showEmployeeEdit = false;
  }
  */
}