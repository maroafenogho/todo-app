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

  late int taskIndex;
  // late String taskName;
int getTaskIndex(String name){
   return  _tasks.indexOf(Task(name: name));
   notifyListeners();
}
  int get taskCount {
    return _tasks.length;
  }

  void editTask(String editedTitle, int index) {
    _tasks.removeAt(index);
    _tasks.insert(index, Task(name: editedTitle));
    notifyListeners();
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
