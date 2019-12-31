import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
                checkboxCallback: (bool checkboxState) {
//              setState(() {
//                Provider.of<TaskData>(context).tasks[index].toggleDone();
//              });
                });
          },
          itemCount: Provider.of<TaskData>(context).tasks.length,
        );
      },
    );
  }
}
