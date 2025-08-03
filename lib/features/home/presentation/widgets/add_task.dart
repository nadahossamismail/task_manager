import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';
import 'package:task_manager/features/home/presentation/home_viewmodel.dart';

class AddTask extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  AddTask({super.key});
  @override
  Widget build(BuildContext context) {
    var vm = context.read<HomeViewmodel>();
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Wrap(
        alignment: WrapAlignment.end,
        runSpacing: 30,
        children: [
          TextField(
            controller: titleController,
            maxLength: 20,
            decoration: const InputDecoration(
              hintText: " e.g. make The bed",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("cancle", style: TextStyle(fontSize: 15)),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.trim().isNotEmpty) {
                vm.addTask(TaskModel(title: titleController.text));
                titleController.clear();
                Navigator.pop(context);
              }
            },
            child: Text("Save", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
