import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen();

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Add Task',
                  style:
                      TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.pink),
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {
                  if (newTaskTitle != null) {
                    final task = Task(name: newTaskTitle);
                    Provider.of<TaskData>(context).addTask(task);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
      ),
    );
  }
}
