import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/core/app_strings.dart';
import 'package:task_manager/features/home/presentation/home_viewmodel.dart';
import 'package:task_manager/features/home/presentation/widgets/add_Task.dart';
import 'package:task_manager/features/home/presentation/widgets/empty_list.dart';
import 'package:task_manager/features/home/presentation/widgets/tasks_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var taskList = Provider.of<HomeViewmodel>(context).loadTasks();
    void openBottomSheet() {
      showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 40,
              bottom: 20,
            ),
            child: AddTask(),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, bottom: 5),
              child: Text(
                AppStrings.homeTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            taskList.isEmpty ? EmptyList() : TasksList(tasksList: taskList),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => openBottomSheet(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
