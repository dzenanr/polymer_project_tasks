import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('project-table')
class ProjectTable extends PolymerElement {
  @published Projects projects;
  Project project;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showTasks = false;

  ProjectTable.created() : super.created();

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
    project = projects.find(code);
    showEdit = true;
  }

  delete(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    project = projects.find(code);
    for (var task in project.tasks) {
      task.employee.tasks.remove(task); // external
    }
    projects.remove(project); // internal
    showTasks = false;
  }

  showProjectTasks(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    ButtonElement tasksButton = target;
    if (!showTasks && tasksButton.text == 'Show') {
      showTasks = true;
      project = projects.find(code);
      project.tasks.internalList = toObservable(project.tasks.internalList);
      project.tasks.order();
      tasksButton.text = 'Hide';
    } else if (showTasks && tasksButton.text == 'Hide') {
      showTasks = false;
      tasksButton.text = 'Show';
    }
  }
}