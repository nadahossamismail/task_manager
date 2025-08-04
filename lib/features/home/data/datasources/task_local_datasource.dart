import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/features/home/data/datasources/task_datasource.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';

class TaskLocalDatasource extends TaskDatasource {
  final Box<TaskModel> taskBox;

  TaskLocalDatasource({required this.taskBox});

  @override
  Future<void> addTask(TaskModel task) async {
    try {
      await taskBox.add(task);
    } catch (e) {
      log("LocalDataBase:addTask => ${e.toString()}");
    }
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    await task.delete();
  }

  @override
  List<TaskModel> loadTasks() {
    try {
      return taskBox.values.toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> toggleTask(TaskModel task) async {
    try {
      task.isCompleted = !task.isCompleted;
      await task.save();
    } catch (e) {
      log("LocalDataBase:toggleTask => ${e.toString()}");
    }
  }
}
