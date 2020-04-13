import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressCallback,
    );
  }

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.longPressCallback});

  final Function longPressCallback;
}
