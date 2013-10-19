import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('task-edit')
class TaskEdit extends PolymerElement {
  @published Task task;
  @published String description;

  inserted() {
    super.inserted();
    description = task.description;
  }

  update(Event e, var detail, Node target) {
    task.description = description;
    var polymerApp = query('#polymer-app');
    var productTable = polymerApp.shadowRoot.query('#project-table').xtag;
    var taskTable = productTable.shadowRoot.query('#task-table').xtag;
    taskTable.tasks.order(); // to see a new description in the list
    taskTable.showEdit = false;
  }
}

