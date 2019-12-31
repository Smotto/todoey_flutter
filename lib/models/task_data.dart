import 'package:flutter/foundation.dart'; // Material has this
import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy le milk'),
  ];
}
