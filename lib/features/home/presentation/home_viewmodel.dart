
import 'package:flutter/material.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';
import 'package:task_manager/features/home/data/repositories/task_repository.dart';

class HomeViewmodel extends ChangeNotifier {
  final TaskRepository taskRepository;
  List<TaskModel> _tasksList = [];

  HomeViewmodel({required this.taskRepository});

  List<TaskModel> get tasksList => _tasksList;

  void loadTasks() {
    _tasksList = taskRepository.loadTasks();
    notifyListeners();
  }

  void addTask(TaskModel task) {
    taskRepository.addTask(task);
    loadTasks();
  }

  void toggleTask(TaskModel task) {
    taskRepository.toggleTask(task);
    loadTasks();
  }

  void deleteTask(TaskModel task) {
    taskRepository.deleteTask(task);
    loadTasks();
  }
}
