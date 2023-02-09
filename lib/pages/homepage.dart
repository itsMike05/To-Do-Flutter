import 'package:flutter/material.dart';
import '../util/todo_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 5,
        title: const Center(
          child: Text(
            "TO DO",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 30, letterSpacing: 5),
          ),
        ),
      ),
      body: ListView(
        children: [
          ToDoItem(taskName: "First", taskCompleted: false, onChanged: null),
          ToDoItem(taskName: "Second", taskCompleted: true, onChanged: null)
        ],
      ),
    );
  }
}
