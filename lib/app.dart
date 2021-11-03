import 'package:flutter/material.dart';
import 'package:inherited_with_streams/widgets/inherited_stream_widget.dart';
import 'package:inherited_with_streams/widgets/student_info.dart';
import 'package:inherited_with_streams/widgets/student_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Inherited + Stream'),
          centerTitle: true,
        ),
        body: InheritedStreamWidget(
          child: SafeArea(
            child: Row(
              children: const [
                StudentInfo(),
                StudentList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
