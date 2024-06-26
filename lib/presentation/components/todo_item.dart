import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/data/model/todo.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap;
  final Function(Todo) onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(todo);
      },
      leading: todo.isDone
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.check_circle_outline,
            ),
      title: Text(
        todo.title,
        style: TextStyle(
          color: todo.isDone ? Colors.grey : Colors.black,
        ),
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(
          DateTime.fromMicrosecondsSinceEpoch(todo.dateTime),
        ),
        style: TextStyle(
          color: todo.isDone ? Colors.grey : Colors.black,
        ),
      ),
      trailing: todo.isDone
          ? GestureDetector(
              onTap: () {
                onDelete(todo);
              },
              child: const Icon(Icons.delete_forever),
            )
          : null,
    );
  }
}
