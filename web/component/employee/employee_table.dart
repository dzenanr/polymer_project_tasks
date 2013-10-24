import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('employee-table')
class EmployeeTable extends PolymerElement {
  @published Employees employees;
  Employee employee;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showTasks = false;

  EmployeeTable.created() : super.created();

  show(Event e, var detail, Node target) {
    ButtonElement showAddButton = $['show-add'];
    if (showAddButton.text == 'Show Add') {
      showAdd = true;
      showAddButton.text = 'Hide Add';
    } else {
      showAdd = false;
      showAddButton.text = 'Show Add';
    }
  }

  edit(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    employee = employees.find(code);
    showEdit = true;
  }

  delete(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    employee = employees.find(code);
    employees.remove(employee);
    showTasks = false;
  }

  showEmployeeTasks(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    ButtonElement tasksButton = target;
    if (!showTasks && tasksButton.text == 'Show') {
      showTasks = true;
      employee = employees.find(code);
      employee.tasks.internalList = toObservable(employee.tasks.internalList);
      employee.tasks.order();
      tasksButton.text = 'Hide';
    } else if (showTasks && tasksButton.text == 'Hide') {
      showTasks = false;
      tasksButton.text = 'Show';
    }
  }
}