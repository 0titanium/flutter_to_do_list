import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/main.dart';
import 'package:flutter_to_do_list/presentation/components/todo_item.dart';
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
            .map((e) => TodoItem(
                  todo: e,
                  onTap: (todo) async {
                    todo.isDone = !todo.isDone;
                    await todo.save(); // 먼저 해야됨

                    setState(() {});
                  },
                  onDelete: (todo) async {
                    await todo.delete();

                    setState(() {});
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateScreen(),
            ),
          );

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
