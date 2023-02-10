import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteItem;

  ToDoItem({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteItem,
              autoClose: true,
              icon: Icons.delete_forever,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              color: taskCompleted ? Colors.amberAccent : Colors.yellow,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black26),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1.5,
                  spreadRadius: 0.0,
                  offset: Offset(1.5, 1.5), // Bottom right shadow direction
                )
              ]),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // Text
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
