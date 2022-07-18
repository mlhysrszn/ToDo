import 'package:flutter/material.dart';
import 'package:to_do/model/to_do_model.dart';
import 'package:to_do/screens/to_do_screen.dart';

import 'screens/add_screen.dart';
import 'screens/done_screen.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({Key? key}) : super(key: key);

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    ToDoScreen(todoList: [
      ToDoModel(0, 'First ToDo', false),
      ToDoModel(0, 'Second ToDo', false),
      ToDoModel(0, 'Third ToDo', false),
      ToDoModel(0, 'Forth ToDo', false),
      ToDoModel(0, 'Fifth ToDo', false),
    ]),
    DoneScreen(todoList: [
      ToDoModel(0, 'First ToDo', true),
      ToDoModel(0, 'Second ToDo', true),
      ToDoModel(0, 'Third ToDo', true),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'To Do'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in), label: 'Done')
        ],
      ),
    );
  }
}
