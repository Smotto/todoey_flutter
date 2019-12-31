import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';
import 'shared_pref.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  SharedPref sharedPref = SharedPref();

  loadSharedPreferences(String key) async {
    try {
      Task task = Task.fromJson(await sharedPref.read(key));
      print(task.name);
    } catch (e) {
      print(e);
    }
  }

  void populateTaskList() async {
    List<String> listOfKeys = await sharedPref.readAll();
    print('KeyListLength: ${listOfKeys.length}');
    for (String key in listOfKeys) {
      try {
        Task task = Task.fromJson(await sharedPref.read(key));
        _tasks.add(task);
        print('key: ${task.name}');
      } catch (e) {
        print(e);
      }
    }
  }

  List<Task> _tasks = [];

  // Not a list view, but a view of a list
  UnmodifiableListView<Task> get tasks {
    populateTaskList();
    return UnmodifiableListView(_tasks);
  }

  void addTask(Task task) {
    populateTaskList();
    sharedPref.save(task.name, task);
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    sharedPref.remove(task.name);
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
