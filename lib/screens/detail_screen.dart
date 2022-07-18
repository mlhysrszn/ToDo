import 'package:cached_network_image/cached_network_image.dart';
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
            Visibility(
              visible: toDoItem.isDone,
              child: CachedNetworkImage(
                imageUrl: 'https://c.tenor.com/3PCreHGZ3rcAAAAM/done-well.gif',
                placeholder: (context, url) => const CircularProgressIndicator(),
              ),
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
