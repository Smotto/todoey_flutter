import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';
import 'shared_pref.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  SharedPref sharedPref = SharedPref();

  loadSharedPreferences() async {
    try {
      Task task = Task.fromJson(await sharedPref.read('task'));
      print(task.name);
    } catch (e) {
      print(e);
    }
  }

  List<Task> _tasks = [];

  // Not a list view, but a view of a list
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(Task task) {
    sharedPref.save('task', task);
    loadSharedPreferences();
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
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
