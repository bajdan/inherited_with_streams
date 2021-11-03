import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inherited_with_streams/models/student.dart';
import 'package:inherited_with_streams/services/stindent_storage.dart';

class InheritedStreamWidget extends InheritedWidget {
  final StreamController<Student> currentStudentController = StreamController<
      Student>();
  final StreamController<
      List<Student>> allStudentsController = StreamController<List<Student>>();

  InheritedStreamWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static InheritedStreamWidget of(BuildContext context) {
    final InheritedStreamWidget? result = context
        .dependOnInheritedWidgetOfExactType<InheritedStreamWidget>();
    assert(result != null, 'No InheritedStreamWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedStreamWidget old) {
    return true;
  }

  void pushCurrentUser(Student student) {
    currentStudentController.add(student);
  }

  void pushAllStudents() async {
    StudentStorage _storage = StudentStorage()..initUsers();

    await Future<void>.delayed(const Duration(milliseconds: 1800));
    allStudentsController.add(_storage.getAllStudents());
  }
}
