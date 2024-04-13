import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/data/model/todo.dart';
import 'package:flutter_to_do_list/presentation/list_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

late final Box<Todo> todos;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  
  todos = await Hive.openBox<Todo>('todolist.db');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListScreen(),
    );
  }
}
