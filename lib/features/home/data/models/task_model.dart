import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'task_model.g.dart';


@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  bool isCompleted;
  TaskModel({required this.title, this.isCompleted = false}):id = const Uuid().v4();
}
