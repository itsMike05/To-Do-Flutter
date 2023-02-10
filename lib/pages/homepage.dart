import 'package:flutter/material.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/util/new_item_dialog.dart';
import '../util/todo_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _dataBox = Hive.box('data_box');
  final _controller = TextEditingController();
  ItemDatabase db = ItemDatabase();

  // When the app starts for the first time
  @override
  void initState() {
    if (_dataBox.get("TODOLIST") == null) {
      db.putTutorialData();
    } else {
      // There are some enties in the db
      db.loadData();
    }
    super.initState();
  }

  // Checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      // Reversing the checkbox state
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  // Create a new item
  void saveNewItem() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      } else {
        Fluttertoast.showToast(
            msg: "Text field cannot be empty", toastLength: Toast.LENGTH_LONG);
      }
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // Delete an existing item
  void deleteItem(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      _controller.clear();
    });
    db.updateDatabase();
  }

  // Create a new todo tile
  void createNewItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewItemDialog(
          controller: _controller,
          onSave: saveNewItem,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoItem(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteItem: (context) => deleteItem(index),
          );
        },
      ),
    );
  }
}
