import 'package:flutter/material.dart';

import 'package:todo_app/models/todo/todo.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoList list = TodoList([
    Todo(title: 'Comprar mercado'),
    Todo(title: 'dormir'),
    Todo(title: 'codear'),
    Todo(title: 'bañarse'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODOS ${list.length}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: _buildItem,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = list.getItemByIndex(index);

    return TodoTile(
      todo: todo,
      onDelete: (id) => setState(() => list.removeItem(id)),
      onTap: (todo) => setState(todo.toggleDone),
    );
  }

  void _addTodo() {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            controller: textController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final value = textController.value.text;

                if (value.isEmpty) {
                  return;
                }

                setState(() => list.addTodo(textController.value.text));

                textController.clear();
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
