import 'package:flutter/material.dart';
import 'package:todolistsampel/models/task.dart';
import 'package:todolistsampel/screens/add_task_screen.dart';
import 'package:todolistsampel/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State createState() {
    return _TasksScreen();
  }
}

class _TasksScreen extends State<TasksScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child:Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((newTextTitle){
                  setState(() {
                    print(newTextTitle);
                    tasks.add(Task(name: newTextTitle));
                    Navigator.pop(context);
                  });
                }),
              ),
            ),
            isScrollControlled: true,
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todo list',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: TasksList(tasks),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];
}