import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  const ToDoItem(
      {super.key, required this.taskName, required this.taskCompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            // Checkbox
            Checkbox(value: true, onChanged: null),
            // Text
            const Text(
              "Finish this app!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
