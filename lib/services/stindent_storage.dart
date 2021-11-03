import 'dart:math';

import 'package:inherited_with_streams/models/student.dart';

class StudentStorage {
  late List<Student> _students;

  final Random _random = Random();
  final List _names = ['Ivan', 'Vasiliy', 'Petr', 'Anna', 'Maria', 'Katya'];
  final List _surnames = [
    'Petrov',
    'Vasyliev',
    'Dumin',
    'Fedotov',
    'Voroshilov',
    'Gagarin'
  ];

  void initUsers() {
    _students = List.generate(40, (index) {
      return Student(
          img: 'assets/ig/student.png',
          name: _names[_random.nextInt(5)],
          surname: _surnames[_random.nextInt(5)],
          group: 'DI-${110 + _random.nextInt(2)}',
          age: 18 + Random().nextInt(2));
    });
  }

  List<Student> getAllStudents() {
    return _students;
  }
}
