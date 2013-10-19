part of polymer_project_tasks;

class TasksModel extends ConceptModel {
  static const String PROJECT = 'Project';
  static const String EMPLOYEE = 'Employee';

  static TasksModel tasksModel;

  String jsonDirPath;

  TasksModel.private();

  static TasksModel one() {
    if (tasksModel == null) {
      tasksModel = new TasksModel.private();
    }
    return tasksModel;
  }

  Map<String, ConceptEntities> newEntries() {
    var map = new Map<String, ConceptEntities>();
    var projects = new Projects();
    map[PROJECT] = projects;
    var employees = new Employees();
    map[EMPLOYEE] = employees;
    return map;
  }

  Projects get projects => getEntry(PROJECT);
  Employees get employees => getEntry(EMPLOYEE);

  init() {
    var project1 = new Project();
    project1.name = 'Learning Dart by Projects';
    project1.description = 'A book about Dart by Dzenan and Ivo';
    projects.add(project1);

    var employee1 = new Employee();
    employee1.firstName = 'Dzenan';
    employee1.lastName = 'Ridjanovic';
    employee1.email = 'dzenanr@gmail.com';
    employees.add(employee1);

    var employee2 = new Employee();
    employee2.firstName = 'Ivo';
    employee2.lastName = 'Balbaert';
    employee2.email = 'ivo.balbaert@telenet.be';
    employees.add(employee2);

    var task1 = new Task();
    task1.project = project1;
    task1.employee = employee1;
    task1.description = 'develop projects';
    project1.tasks.add(task1);
    employee1.tasks.add(task1);

    var task2 = new Task();
    task2.project = project1;
    task2.employee = employee2;
    task2.description = 'write about projects';
    project1.tasks.add(task2);
    employee2.tasks.add(task2);

    var project2 = new Project();
    project2.name = 'On Dart';
    project2.description = 'A web site for On Dart Education';
    projects.add(project2);

    var task3 = new Task();
    task3.project = project2;
    task3.employee = employee1;
    task3.description = 'prepare courses On Dart';
    project2.tasks.add(task3);
    employee1.tasks.add(task3);
  }

  display() {
    print('===========');
    print('Tasks Model');
    print('===========');
    for (var project in projects) {
      print('  Project');
      print('  -------');
      print(project.toString());
      print('    Tasks');
      print('    -----');
      for (var task in project.tasks) {
        print(task.toString());
      }
    }
    print('===========');
    for (var employee in employees) {
      print('  Employee');
      print('  --------');
      print(employee.toString());
      print('    Tasks');
      print('    -----');
      for (var task in employee.tasks) {
        print(task.toString());
      }
    }
    print(
      '=========== =========== =========== '
      '=========== =========== =========== '
    );
  }
}



