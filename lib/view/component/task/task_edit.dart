import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';
import 'task_table.dart';

@CustomTag('task-edit')
class TaskEdit extends PolymerElement {
  @published Task task;

  TaskEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    var polymerApp = querySelector('#polymer-app');
    var productTable = polymerApp.shadowRoot.querySelector('#project-table');
    TaskTable taskTable = productTable.shadowRoot.querySelector('#task-table');
    taskTable.showEdit = false;
    polymerApp.saveData();
    window.location.reload();
  }
}

