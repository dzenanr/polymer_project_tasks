part of polymer_project_tasks;

class Employee extends ConceptEntity<Employee> {
  String lastName;
  String firstName;
  String _email;
  Tasks tasks = new Tasks(); // external relationship

  String get email => _email;
  set email(String email) {
    _email = email;
    if (code == null) {
      code = emailCode;
    }
  }

  String get name => '${lastName}, ${firstName}';
  String get emailCode => email.replaceAll('.', '-').replaceAll('@', '-');

  Employee newEntity() => new Employee();

  String toString() {
    return '  {\n'
           '    code: ${code}\n'
           '    firstName: ${firstName}\n'
           '    lastName: ${lastName}\n'
           '    email: ${email}\n'
           '  }\n';
  }

  /**
   * Compares two employess based on last names, then on first names.
   * If the result is less than 0 then the first member is less than the second,
   * if it is equal to 0 they are equal and
   * if the result is greater than 0 then the first is greater than the second.
   */
  int compareTo(Employee employee) {
    if (lastName != null && firstName != null) {
      int comparison = lastName.compareTo(employee.lastName);
      if (comparison == 0) {
        comparison = firstName.compareTo(employee.firstName);
      }
      return comparison;
    }
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['code'] = code;
    entityMap['lastName'] = lastName;
    entityMap['firstName'] = firstName;
    entityMap['email'] = email;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    code = entityMap['code'];
    lastName = entityMap['lastName'];
    firstName = entityMap['firstName'];
    email = entityMap['email'];
  }
}

class Employees extends ConceptEntities<Employee> {
  Employees newEntities() => new Employees();
  Employee newEntity() => new Employee();
}

