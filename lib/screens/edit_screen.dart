import 'package:flutter/material.dart';
import 'package:to_do/model/to_do_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  static const routeName = '/editScreen';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ToDoModel;
    textController.text = args.text;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                  labelText: args.text, border: const OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: OutlinedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context, 'Canceled');
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      child: const Text('Edit'),
                      onPressed: () {
                        Navigator.pop(context, 'Todo Edited');
                        print(textController.text);
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}