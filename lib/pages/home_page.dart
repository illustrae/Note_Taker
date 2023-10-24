import 'package:flutter/material.dart';
import 'package:flutter_testing/components/content_box.dart';
import 'package:flutter_testing/components/todo_notes.dart';
import 'package:flutter_testing/database/data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:math';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//reference the hive memory box
  final _myMemoryBox = Hive.box('memoryBox');
  ToDoNotesDataBase db = ToDoNotesDataBase();


  @override
  void initState() {
    if (_myMemoryBox.get("TODOLIST") == null) {
      db.createInitialDatabase();
    } else {
      db.loadData();
    }

    super.initState();
  }

//text controller
  final _controller = TextEditingController();

//this is the checkbox function
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

//save new task

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

//new task button and pop up
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return ContentBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

//delete a task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

//Move task down the list
  void moveTaskDown(int index) {
    if (index < db.toDoList.length - 1) {
      setState(() {
        // Swap the current task with the task below it
        final temp = db.toDoList[index];
        db.toDoList[index] = db.toDoList[index + 1];
        db.toDoList[index + 1] = temp;
      });
      db.updateDatabase();
    }
  }

//Move task up the list
  void moveTaskUp(int index) {
    if (index > 0) {
      setState(() {
        // Swap the current task with the task below it
        final temp = db.toDoList[index];
        db.toDoList[index] = db.toDoList[index - 1];
        db.toDoList[index - 1] = temp;
      });
      db.updateDatabase();
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white12,
    appBar: AppBar(
      centerTitle: true,
      title: const Text("TASKIFY"),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: createNewTask,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Icon(Icons.add),
    ),
    body: db.toDoList.isEmpty
        ? ImageBackground() // Display image background when the list is empty
        : ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoNotes(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
                moveDownFunction: (context) => moveTaskDown(index),
                moveUpFunction: (context) => moveTaskUp(index),
              );
            },
          ),
  );
}

Widget ImageBackground() {
  // Replace this with your image or image widget
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/notesImage.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: const Center(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 45.0),
          child: Text(
            'Uh Oh – Start a task!',
            style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
}
