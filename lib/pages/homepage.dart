import 'package:flutter/material.dart';
import '../util/todo_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of todo items (expandable in the future)
  List toDoList = [
    ["Thing 1", false],
    ["To do 2", true],
    ["Last thing here", false]
  ];

  // Checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      // Reversing the checkbox state
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Create a new todo tile
  void createNewItem() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 5,
        title: const Center(
          child: Text(
            "YUP, ANOTHER TO DO APP",
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 15, letterSpacing: 5),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewItem,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoItem(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index));
        },
      ),
    );
  }
}
