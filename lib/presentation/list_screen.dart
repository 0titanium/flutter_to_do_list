import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/presentation/create_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('title 1'),
            subtitle: Text('sub title 1'),
          ),
          ListTile(
            title: Text('title 2'),
            subtitle: Text('sub title 2'),
          ),
          ListTile(
            title: Text('title 3'),
            subtitle: Text('sub title 3'),
          ),
        ],
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
