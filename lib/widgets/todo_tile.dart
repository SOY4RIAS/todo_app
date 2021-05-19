import 'package:flutter/material.dart';
import 'package:todo_app/models/models.dart';

import 'dismiss_container.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final void Function(int) onDelete;
  final void Function(Todo) onTap;

  TodoTile({
    required this.todo,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final key = UniqueKey();

    return Dismissible(
      key: Key(key.toString()),
      background: DismissContainer(
        color: Colors.red,
        icon: Icons.cancel,
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onDelete(todo.id!);
        }
      },
      child: ListTile(
        onTap: () => onTap(todo),
        title: Text(todo.title),
        trailing: Icon(
          todo.status.icon,
          color: todo.status.color,
        ),
      ),
    );
  }
}
