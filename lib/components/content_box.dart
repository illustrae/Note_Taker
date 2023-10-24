import 'package:flutter/material.dart';
import 'package:flutter_testing/components/buttons.dart';

class ContentBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  ContentBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.purple[100],
        content: Container(
            height: 150,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add a new Note",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Save button
                      NoteButtons(text: "Save", onPressed: onSave),
                      //Cancel Button
                      NoteButtons(text: "Cancel", onPressed: onCancel),
                    ],
                  )
                ])));
  }
}
