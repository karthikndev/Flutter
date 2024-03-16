import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          body: GradientContainer(Color.fromARGB(255, 52, 2, 18),
               Color.fromARGB(255, 22, 1, 9))),
    ),
  );
}
