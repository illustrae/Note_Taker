import 'package:flutter/material.dart';

class ToDoNotes extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoNotes(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.purple[900], borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            //checkbox
            Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.purple[200]),

            //note name
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
