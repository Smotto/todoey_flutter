import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy le milk'),
    Task(name: 'Buy le eggs'),
    Task(name: 'Buy le bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return TaskTile(
          taskTitle: tasks[index].name, isChecked: tasks[index].isDone);
    },
    itemCount: tasks.length,);
  }
}
