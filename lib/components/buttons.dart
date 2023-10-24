import 'package:flutter/material.dart';

class NoteButtons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

 NoteButtons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: Theme.of(context).primaryColor,
    child: Text(text));
  }
}