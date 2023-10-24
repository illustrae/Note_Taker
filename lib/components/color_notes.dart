import 'package:flutter/material.dart';
import 'dart:math';

Color getRandomColor(bool taskCompleted) {
  final List<Color> randomColors = [
    Colors.deepPurple,
    Color.fromARGB(255, 52, 155, 206)
  ];

  final List<Color> completedColors = [
    Color.fromARGB(255, 248, 146, 63),
  ];

  final Random random = Random();

  if (taskCompleted) {
    return completedColors[random.nextInt(completedColors.length)];
  } else {
    return randomColors[random.nextInt(randomColors.length)];
  }
}

