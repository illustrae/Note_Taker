import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoNotes extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? moveDownFunction;
  Function(BuildContext)? moveUpFunction;

  ToDoNotes(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction,
      required this.moveDownFunction,
      required this.moveUpFunction});

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                borderRadius: BorderRadius.circular(12),
                onPressed: deleteFunction,
                icon: Icons.delete,
                flex: 1,
                backgroundColor: Colors.red.shade300),
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: moveDownFunction,
              
              backgroundColor: Color.fromARGB(255, 233, 179, 1),
              foregroundColor: Colors.purple[900],
              icon: Icons.arrow_downward),
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: moveUpFunction,
              
              backgroundColor: Color.fromARGB(255, 0, 199, 50),
              foregroundColor: Colors.purple[900],
              icon: Icons.arrow_upward,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.purple[900],
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.purple[200]),

              //note information
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                      color: Colors.white,
                      decorationColor: Colors.redAccent,
                      decorationThickness: 5,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
