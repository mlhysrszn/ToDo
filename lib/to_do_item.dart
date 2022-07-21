import 'package:flutter/material.dart';
import 'package:to_do/model/to_do_model.dart';

import 'screens/detail_screen.dart';
import 'screens/edit_screen.dart';

class ToDoItemView extends StatefulWidget {
  const ToDoItemView({Key? key, required this.toDoItem}) : super(key: key);

  final ToDoModel toDoItem;

  @override
  State<ToDoItemView> createState() => _ToDoItemViewState();
}

class _ToDoItemViewState extends State<ToDoItemView> {
  late Map<String, dynamic> _toDo;

  @override
  void initState() {
    super.initState();
    _toDo = {
      'id': widget.toDoItem.id,
      'text': widget.toDoItem.text,
      'isDone': widget.toDoItem.isDone
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(toDoItem: widget.toDoItem)));
        },
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    widget.toDoItem.text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _toDo['isDone'],
                      onChanged: (bool? value) {
                        setState(() {
                          _toDo['isDone'] = value!;
                          ToDoModel.update(
                              widget.toDoItem.id, widget.toDoItem.text, value);
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _navigateAndDisplaySelection(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.pushNamed(context, EditScreen.routeName,
        arguments: widget.toDoItem);

    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}
