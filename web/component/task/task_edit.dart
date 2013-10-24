import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('task-edit')
class TaskEdit extends PolymerElement {
  @published Task task;
  @published String description;

  TaskEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    description = task.description;
  }

  update(Event e, var detail, Node target) {
    task.description = description;
    var polymerApp = querySelector('#polymer-app');
    var productTable = polymerApp.shadowRoot.querySelector('#project-table');
    var taskTable = productTable.shadowRoot.querySelector('#task-table');
    taskTable.showEdit = false;
    task.project.tasks.order();  // to see a new description in project tasks
    task.employee.tasks.order(); // to see a new description in employee tasks
  }
}

