import 'package:flutter/material.dart';
import 'package:todolistsampel/models/task.dart';
import 'package:todolistsampel/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaskList();
  }
}

class _TaskList extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (newValue) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }

  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
}
