import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Beans'),
  ];

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  UnmodifiableListView<Task>? get tasks {
    return UnmodifiableListView(_tasks);
  }

  late String taskName;

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newString) {
    _tasks.add(Task(name: newString));
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
