import 'dart:collection';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';
import 'package:task_manager/features/home/data/repositories/task_repository.dart';

class HomeViewmodel extends ChangeNotifier {
  final TaskRepository taskRepository;
  List<TaskModel> _tasksList = [];

  HomeViewmodel({required this.taskRepository});

  UnmodifiableListView<TaskModel> get tasksList =>
      UnmodifiableListView(_tasksList);

  List<TaskModel> loadTasks() {
    _tasksList = taskRepository.loadTasks();
    log("view model");
    log(_tasksList.length.toString());
    return _tasksList;
  }

  void addTask(TaskModel task) {
    taskRepository.addTask(task);
    notifyListeners();
  }

  void toggleTask(TaskModel task) {
    taskRepository.toggleTask(task);
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    taskRepository.deleteTask(task);
    notifyListeners();
  }
}
