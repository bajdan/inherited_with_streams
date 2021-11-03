import 'package:flutter/material.dart';
import 'package:inherited_with_streams/models/student.dart';
import 'package:inherited_with_streams/widgets/inherited_stream_widget.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<InheritedStreamWidget>()?.pushAllStudents();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: StreamBuilder<List<Student>>(
        stream: context.dependOnInheritedWidgetOfExactType<InheritedStreamWidget>()?.allStudentsController.stream,
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            List<Student>? students = snapshot.data;
            return ListView.builder(
              itemCount: students!.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    child: ListTile(
                      title: Text('${students[index].name} ${students[index].surname}'),
                    ),
                    onTap: (){
                      context.dependOnInheritedWidgetOfExactType<InheritedStreamWidget>()?.pushCurrentUser(students[index]);
                    },
                  );
                }
            );
          }
        },
      ),
    );
  }
}
