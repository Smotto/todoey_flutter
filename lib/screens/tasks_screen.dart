import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding:
            EdgeInsets.only(left: 30.0, top: 60.0, right: 30.0, bottom: 30.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child:
                  Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent),
              backgroundColor: Colors.white,
              radius: 30.0,
            ),
            SizedBox(height: 10.0),
            Text('Todoey',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
