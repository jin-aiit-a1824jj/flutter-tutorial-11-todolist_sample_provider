import 'package:flutter/material.dart';
import 'package:todolistsampel/models/task.dart';
import 'package:todolistsampel/widgets/task_tile.dart';

class TasksList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TaskList();
  }

  final List<Task> tasks;
  TasksList(this.tasks);
}

class _TaskList extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (newValue) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }

}
