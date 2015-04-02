import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';
import 'project_table.dart';

@CustomTag('project-edit')
class ProjectEdit extends PolymerElement {
  @published Projects projects;
  @published Project project;

  ProjectEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    var polymerApp = querySelector('#polymer-app');
    ProjectTable projectTable =
        polymerApp.shadowRoot.querySelector('#project-table');
    projectTable.showEdit = false;
    polymerApp.saveData();
    window.location.reload();
  }
}