import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State createState() {
    return _TaskTileState();
  }
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(
        'This is a task.',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBox(
          checkboxStatue: isChecked,
          toggleCheckboxState: (checkboxState){
            setState(() {
              isChecked = checkboxState;
            });
          }),
    );
  }

  bool isChecked = false;

}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxStatue;
  final Function toggleCheckboxState;

  TaskCheckBox({this.checkboxStatue, this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxStatue,
      onChanged: toggleCheckboxState,
    );
  }
}
