part of polymer_project_tasks;

class Task extends ConceptEntity<Task> {
  Project _project;
  Employee _employee;
  String description;

  Project get project => _project;
  set project(Project project) {
    _project = project;
    if (code == null && employee != null) {
      code = '${project.code}-${employee.code}';
    }
  }

  Employee get employee => _employee;
  set employee(Employee employee) {
    _employee = employee;
    if (code == null && project != null) {
      code = '${project.code}-${employee.code}';
    }
  }

  Task newEntity() => new Task();

  String toString() {
    return '    {\n'
           '    code: ${code}\n'
           '      project.name: ${project.name}\n'
           '      employee.email: ${employee.email}\n'
           '      description: ${description}\n'
           '    }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['code'] = code;
    //entityMap['project'] = project.code;
    entityMap['employee'] = employee.code;
    entityMap['description'] = description;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    code = entityMap['code'];
    String employeeCode = entityMap['employee'];
    employee = TasksModel.one().employees.find(employeeCode);
    employee.tasks.add(this);
    // Project --< Task is internal; Employee --< Task is external
    description = entityMap['description'];
  }
}

class Tasks extends ConceptEntities<Task> {
  Tasks newEntities() => new Tasks();
  Task newEntity() => new Task();
}

