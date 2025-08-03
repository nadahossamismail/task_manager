import 'package:flutter/material.dart';
import 'package:task_manager/features/home/presentation/widgets/add_Task.dart';
import 'package:task_manager/features/home/presentation/widgets/tasks_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
          //spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, bottom: 5),
              child: Text(
                "Tasks",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
              ),
            ),
            TasksList(),
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
