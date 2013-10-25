import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('task-add')
class TaskAdd extends PolymerElement {
  @published Project project;
  @published Tasks tasks;
  Employees employees = TasksModel.one().employees;

  TaskAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement description = $['description'];
    SelectElement employeeLookup = $['employee-lookup'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (!error) {
      var task = new Task();
      task.project = project;
      String code = employeeLookup.value;
      task.employee = employees.find(code);
      task.description = description.value;
      // project.tasks internal; employee.tasks external
      if (tasks.add(task) && task.employee.tasks.add(task)) {
        message.text = 'added';
        tasks.order();
      } else {
        message.text = 'task with the same project and employee already exists';
      }
    }
  }

}

