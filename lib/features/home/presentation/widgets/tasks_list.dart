import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';
import 'package:task_manager/features/home/presentation/home_viewmodel.dart';
import 'package:task_manager/features/home/presentation/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.tasksList});
  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    var vm = context.read<HomeViewmodel>();
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
        itemBuilder:
            (context, index) => Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                vm.deleteTask(tasksList[index]);
              },
              background: Container(
                margin: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 67, 56),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              key: ValueKey(index),
              child: TaskTile(task: tasksList[index]),
            ),
      ),
    );
  }
}
