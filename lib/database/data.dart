import 'package:hive_flutter/hive_flutter.dart';

class ToDoNotesDataBase {
  List toDoList = [];

  final _myMemoryBox = Hive.box("memoryBox");

//create initial data. run this method on first launch ever

  void createInitialDatabase() {
    toDoList = [
      ["Make a new note", false],
      ["Delete the current notes", false]
    ];
  }

//load the data from database
  void loadData() {
    toDoList = _myMemoryBox.get('TODOLIST');
  }

//update the database
  void updateDatabase() {
    _myMemoryBox.put("TODOLIST", toDoList);
  }
}
