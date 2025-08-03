import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';

class HomeViewmodel extends ChangeNotifier {
  final List<TaskModel> _tasksList = [];

  UnmodifiableListView<TaskModel> get tasksList =>
      UnmodifiableListView(_tasksList);

  void loadTasks() {
 
    notifyListeners();
  }

  void addTask(TaskModel task) {
    _tasksList.add(task);
    notifyListeners();
  }

  void toggleTask(TaskModel task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}
