import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';
import 'package:task_manager/features/home/presentation/home_viewmodel.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var vm = context.read<HomeViewmodel>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            spacing: 15,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8, color: Colors.grey),
                  color:
                      task.isCompleted
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Checkbox(
                  value: task.isCompleted,
                  onChanged: (checked) {
                    vm.toggleTask(task);
                  },
                  activeColor: Colors.transparent,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: BorderSide.none,
                ),
              ),
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  decorationThickness: 1.3,
                  decoration:
                      task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
