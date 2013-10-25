import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('employee-add')
class EmployeeAdd extends PolymerElement {
  @published Employees employees;

  EmployeeAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement firstName = $['first-name'];
    InputElement lastName = $['last-name'];
    InputElement email = $['email'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (firstName.value.trim() == '') {
      message.text = 'employee first name is required; ${message.text}';
      error = true;
    }
    if (lastName.value.trim() == '') {
      message.text = 'employee last name is required; ${message.text}';
      error = true;
    }
    if (email.value.trim() == '') {
      message.text = 'employee email is required; ${message.text}';
      error = true;
    }
    if (!error) {
      var employee = new Employee();
	    employee.firstName = firstName.value;
	    employee.lastName = lastName.value;
	    employee.email = email.value;
      if (employees.add(employee)) {
        message.text = 'added';
        employees.order();
      } else {
        message.text = 'employee email already in use';
      }
    }
  }
}