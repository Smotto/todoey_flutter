import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'tasks_screen.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String taskTitle;

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
                  taskTitle = value;
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
                  if (taskTitle != null) {
                    addTaskCallback(taskTitle);
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


