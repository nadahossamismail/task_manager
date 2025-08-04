import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:task_manager/core/app_strings.dart';
import 'package:task_manager/features/home/data/datasources/task_local_datasource.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';
import 'package:task_manager/features/home/data/repositories/task_repository.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initHome();
  serviceLocator.registerLazySingleton(
    () => Hive.box<TaskModel>(AppStrings.hiveBox),
  );
}

void _initHome() {
  serviceLocator.registerFactory<TaskLocalDatasource>(
    () => TaskLocalDatasource(taskBox: serviceLocator()),
  );
  serviceLocator.registerFactory<TaskRepository>(
    () => TaskRepository(taskLocalDatasource: serviceLocator()),
  );
}
