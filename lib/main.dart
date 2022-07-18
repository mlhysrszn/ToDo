import 'package:flutter/material.dart';
import 'package:to_do/screens/edit_screen.dart';
import 'package:to_do/to_do_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {EditScreen.routeName: (context) => const EditScreen()},
      title: 'To Do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
