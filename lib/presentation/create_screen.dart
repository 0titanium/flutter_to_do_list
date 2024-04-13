import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/data/model/todo.dart';
import 'package:flutter_to_do_list/main.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Write To do'),
        actions: [
          IconButton(
            onPressed: () async {
              await todos.add(Todo(
                title: _textController.text,
                dateTime: DateTime.now().millisecondsSinceEpoch,
              ));

              // mounted : 화면이 잘 표시되고 있는지에 대한 변수라는 느낌으로 접근
              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.greenAccent,
              hintText: 'Write your to do'),
        ),
      ),
    );
  }
}
