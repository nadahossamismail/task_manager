import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  AddTask({super.key});
  @override
  Widget build(BuildContext context) {
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
              if (titleController.text.trim().isNotEmpty) {}
            },
            child: Text("Save", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
