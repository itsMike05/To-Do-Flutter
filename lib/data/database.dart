import 'package:hive_flutter/hive_flutter.dart';

class ItemDatabase {
  List toDoList = [];
  final _dataBox = Hive.box('data_box');

  void putTutorialData() {
    toDoList = [
      ["1st item on the list", false],
      ["Second item here!", true]
    ];
  }

  void loadData() {
    toDoList = _dataBox.get("TODOLIST");
  }

  void updateDatabase() {
    _dataBox.put("TODOLIST", toDoList);
  }
}
