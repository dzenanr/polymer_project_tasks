import 'dart:html';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('project-add')
class ProjectAdd extends PolymerElement {
  @published Projects projects;

  add(Event e, var detail, Node target) {
    InputElement name = $['name'];
    InputElement description = $['description'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'project name is required; ${message.text}';
      error = true;
    }
    if (!error) {
      var project = new Project();
	    project.name = name.value;
	    project.description = description.value;
      if (projects.add(project)) {
        message.text = 'added';
        var polymerApp = query('#polymer-app');
        var projectTable = polymerApp.shadowRoot.query('#project-table').xtag;
        projectTable.projects.order(); // projects.order();
      } else {
        message.text = 'project name already in use';
      }
    }
  }
}