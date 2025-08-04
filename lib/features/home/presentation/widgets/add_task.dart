import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/core/app_strings.dart';
import 'package:task_manager/features/home/data/models/task_model.dart';
import 'package:task_manager/features/home/presentation/home_viewmodel.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late TextEditingController titleController;

  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

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
            maxLength: 30,
            enableInteractiveSelection: true,
            readOnly: false,
            decoration: const InputDecoration(
              hintText: AppStrings.hintTextForTitle,
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
                vm.addTask(TaskModel(title: titleController.text.trim()));
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
