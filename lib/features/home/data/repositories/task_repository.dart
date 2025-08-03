import 'package:task_manager/features/home/data/datasources/task_local_datasource.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';

class TaskRepository {
  final TaskLocalDatasource taskLocalDatasource;

  TaskRepository({required this.taskLocalDatasource});

  void addTask(TaskModel task) {
    taskLocalDatasource.addTask(task);
  }

  void deleteTask(TaskModel task) {
    taskLocalDatasource.deleteTask(task);
  }

  List<TaskModel> loadTasks() {
    return taskLocalDatasource.loadTasks();
  }

  void toggleTask(TaskModel task) {
    taskLocalDatasource.toggleTask(task);
  }
}
