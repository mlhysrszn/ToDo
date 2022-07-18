import 'package:flutter/material.dart';
import 'package:to_do/to_do_item.dart';

import '../model/to_do_model.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key, required this.todoList}) : super(key: key);

  final List<ToDoModel> todoList;

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = widget.todoList[index];
          return Dismissible(
              key: Key(item.text),
              onDismissed: (direction) {
                setState(() {
                  widget.todoList.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.text} dismissed.')));
              },
              background: Container(
                color: Colors.red,
              ),
              child: ToDoItemView(toDoItem: item));
        },
        itemCount: widget.todoList.length,
      ),
    );
  }
}