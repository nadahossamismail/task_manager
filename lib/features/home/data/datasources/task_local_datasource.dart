import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/features/home/data/datasources/task_datasource.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';

class TaskLocalDatasource extends TaskDatasource {
  final Box<TaskModel> taskBox;

  TaskLocalDatasource({required this.taskBox});

  @override
  void addTask(TaskModel task) {
    try {
      taskBox.add(task);
    } catch (e) {}
  }

  @override
  void deleteTask(TaskModel task) {
    task.delete();
  }

  @override
  List<TaskModel> loadTasks() {
    log("data source");
    log(taskBox.values.toList().length.toString());
    try {
      return taskBox.values.toList();
    } catch (e) {
      return [];
    }
  }

  @override
  void toggleTask(TaskModel task) {
    try {
      task.isCompleted = !task.isCompleted;
      task.save();
    } catch (e) {}
  }
}
