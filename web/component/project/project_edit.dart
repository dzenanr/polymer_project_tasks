import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('project-edit')
class ProjectEdit extends PolymerElement {
  @published Projects projects;
  @published Project project;
  @published String description;

  ProjectEdit.created() : super.created();

  enteredView() {
    super.enteredView();
    description = project.description;
  }

  update(Event e, var detail, Node target) {
    project.description = description;
    projects.order(); // to see a new description in the list
    var polymerApp = querySelector('#polymer-app');
    var projectTable = polymerApp.shadowRoot.querySelector('#project-table');
    projectTable.showEdit = false;
  }
}