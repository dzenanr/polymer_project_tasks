import 'dart:html';
import 'dart:convert';
import 'package:polymer_project_tasks/polymer_project_tasks.dart';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  static const String EMPLOYEE_TASKS = 'polymer-employee-tasks';
  static const String PROJECT_TASKS = 'polymer-project-tasks';

  TasksModel tasksModel;
  Employees employees;
  Projects projects;

  PolymerApp() {
    // using singleton (one object only) pattern http://en.wikipedia.org/wiki/Singleton_pattern
    tasksModel = TasksModel.one();
    employees = tasksModel.employees;
    projects = tasksModel.projects;
    //tasksModel.init(); // comment load to reinit
    load();
    //tasksModel.display();
    employees.internalList = toObservable(employees.internalList);
    projects.internalList = toObservable(projects.internalList);

    /*
    var categoryLinksModel = new CategoryLinksModel();
    categories = categoryLinksModel.categories;

    // load data
    String json = window.localStorage[NAME];
    if (json == null) {
      categoryLinksModel.init();
    } else {
      categories.fromJson(JSON.decode(json));
    }

    categories.internalList = toObservable(categories.internalList);
    */
  }

  loadEmployees() {
    String json = window.localStorage[EMPLOYEE_TASKS];
    if (json == null) {
      tasksModel.init();
    } else {
      employees.fromJson(JSON.decode(json));
    }
    employees.order();
  }

  loadProjects() {
    String json = window.localStorage[PROJECT_TASKS];
    if (json != null) {
      projects.fromJson(JSON.decode(json));
    }
    projects.order();
  }

  load() {
    loadEmployees();
    loadProjects();
  }

  saveEmployees() {
    window.localStorage[EMPLOYEE_TASKS] = JSON.encode(employees.toJson());
  }

  saveProjects() {
    window.localStorage[PROJECT_TASKS] = JSON.encode(projects.toJson());
  }

  save(Event e, var detail, Node target) {
    saveEmployees();
    saveProjects();
  }
}