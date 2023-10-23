import 'package:flutter/material.dart';
import 'package:flutter_testing/components/todo_notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ["Testing one", false],
    ["Exercise testing", false],
  ];

//this is the checkbox function
  void checkBoxChanged(bool? value, int index) {

    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Goals"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoNotes(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
