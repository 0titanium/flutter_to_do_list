import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/main.dart';
import 'package:flutter_to_do_list/presentation/create_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: todos.values
            .map((todo) => ListTile(
                  title: Text(todo.title),
                  subtitle: Text('${todo.dateTime}'),
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
