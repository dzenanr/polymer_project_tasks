import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('task-add')
class TaskAdd extends PolymerElement {
  @published Project project;
  @published Tasks tasks;
  Employees employees = TasksModel.one().employees;

  add(Event e, var detail, Node target) {
    InputElement description = $['description'];
    SelectElement employeeLookup = $['employee-lookup'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (!error) {
      var task = new Task();
      task.project = project;
      String employeeCode = employeeLookup.value;
      task.employee = TasksModel.one().employees.find(employeeCode);
      task.description = description.value;
      if (tasks.add(task) && task.employee.tasks.add(task)) {
        message.text = 'added';
        var polymerApp = query('#polymer-app');
        var productTable = polymerApp.shadowRoot.query('#project-table').xtag;
        var taskTable = productTable.shadowRoot.query('#task-table').xtag;
        taskTable.tasks.order();
      } else {
        message.text = 'task with the same project and employee already exists';
      }
    }
  }

}

