import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String title;
  const TaskTile({super.key, required this.title});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            spacing: 15,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: Colors.grey),
                  color:
                      isChecked!
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Checkbox(
                  value: isChecked,
                  onChanged: (checked) {
                    setState(() {
                      isChecked = checked;
                    });
                  },
                  activeColor: Colors.transparent,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: BorderSide.none,
                ),
              ),
              Text(widget.title, style: TextStyle(fontSize: 17)),
            ],
          ),
        ),
      ),
    );
  }
}
