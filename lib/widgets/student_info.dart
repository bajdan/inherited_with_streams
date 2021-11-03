import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_with_streams/models/student.dart';
import 'package:inherited_with_streams/widgets/inherited_stream_widget.dart';

class StudentInfo extends StatelessWidget {
  const StudentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: StreamBuilder<Student>(
        stream: context
            .dependOnInheritedWidgetOfExactType<InheritedStreamWidget>()
            ?.currentStudentController
            .stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Nothing selected'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/img/student.png'),
                      fit: BoxFit.cover,
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text('Name: ${snapshot.data!.name}'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text('Surname: ${snapshot.data!.surname}'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text('Age: ${snapshot.data!.age}'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text('Group: ${snapshot.data!.group}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
