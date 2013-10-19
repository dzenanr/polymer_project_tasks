part of polymer_project_tasks;

class Project extends ConceptEntity<Project> {
  String _name;
  String description;
  Tasks tasks = new Tasks(); // internal relationship

  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = nameCode;
    }
  }

  String get nameCode => name.replaceAll(' ', '-');

  Project newEntity() => new Project();

  String toString() {
    return '  {\n'
           '    code: ${code}\n'
           '    name: ${name}\n'
           '    description: ${description}\n'
           '  }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['code'] = code;
    entityMap['name'] = name;
    entityMap['description'] = description;
    entityMap['tasks'] = tasks.toJson();
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    code = entityMap['code'];
    name = entityMap['name'];
    description = entityMap['description'];
    tasks.fromJson(entityMap['tasks']);
    tasks.forEach((task) {task.project = this;});
  }
}

class Projects extends ConceptEntities<Project> {
  Projects newEntities() => new Projects();
  Project newEntity() => new Project();
}

