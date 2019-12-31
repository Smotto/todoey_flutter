import 'package:flutter/foundation.dart'; // Material has this
import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy le milk'),
    Task(name: 'Buy le e g g'),
    Task(name: 'Buy le m i l k'),
  ];

  // Not a list view, but a view of a list
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
