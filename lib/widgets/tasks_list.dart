import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistsampel/models/task.dart';
import 'package:todolistsampel/models/task_data.dart';
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
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (newValue) {
//            setState(() {
//              Provider.of<TaskData>(context).tasks[index].toggleDone();
//            });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }

}
