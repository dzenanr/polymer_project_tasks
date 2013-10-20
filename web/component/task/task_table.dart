import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('task-table')
class TaskTable extends PolymerElement {
  @published Employee employee;
  @published Project project;
  @published Tasks tasks;
  Task task;
  @observable bool showAdd = false;
  @observable bool showEdit = false;

  inserted() {
    super.inserted();
    if (project != null) tasks = project.tasks;
    if (employee != null) tasks = employee.tasks;
    tasks.internalList = toObservable(tasks.internalList);
  }

  show(Event e, var detail, Node target) {
    ButtonElement showAddButton = $['show-add'];
    if (project == null && showAddButton.text == 'Add by Project') {
      showAddButton.hidden = true;
    } else if (project == null) {
      showAddButton.text = 'Add by Project';
    } else if (showAddButton.text == 'Show Add') {
      showAdd = true;
      showAddButton.text = 'Hide Add';
    } else {
      showAdd = false;
      showAddButton.text = 'Show Add';
    }
  }

  edit(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    task = tasks.find(code);
    showEdit = true;
  }

  delete(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    task = tasks.find(code);
    task.project.tasks.remove(task);  // internal
    task.employee.tasks.remove(task); // external
  }
}