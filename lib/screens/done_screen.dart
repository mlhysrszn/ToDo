import 'package:flutter/material.dart';
import 'package:to_do/to_do_item.dart';

import '../model/to_do_model.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key, required this.todoList}) : super(key: key);

  final List<ToDoModel> todoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Screen'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoItemView(toDoItem: todoList[index]);
        },
        itemCount: todoList.length,
      ),
    );
  }
}
