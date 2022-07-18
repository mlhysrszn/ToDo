import 'package:flutter/material.dart';

import '../model/to_do_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.toDoItem}) : super(key: key);

  final ToDoModel toDoItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              toDoItem.isDone ? Icons.dangerous : null,
              color: Colors.red,
              size: 32,
            ),
            Text(
              toDoItem.text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}