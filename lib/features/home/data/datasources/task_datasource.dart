import 'package:task_manager/features/home/data/models/task_model.dart';

abstract class TaskDatasource {
  List<TaskModel> loadTasks();
  void addTask(TaskModel task);
  void deleteTask(TaskModel task);
  void toggleTask(TaskModel task);
}
