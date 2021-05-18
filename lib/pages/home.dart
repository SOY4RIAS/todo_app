import 'package:flutter/material.dart';

import 'package:todo_app/models/todo/todo.dart';

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
    final todo = list.getItem(index);
    final status = todo.status;
    final key = UniqueKey();

    return Dismissible(
      key: Key(key.toString()),
      background: _DissmissContent(color: Colors.red),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          setState(() => list.removeItem(index));
        }
      },
      child: ListTile(
        onTap: () => setState(todo.toggleDone),
        title: Text(todo.title),
        trailing: Icon(
          status.icon,
          color: status.color,
        ),
      ),
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

class _DissmissContent extends StatelessWidget {
  final Color color;

  const _DissmissContent({this.color});

  @override
  Widget build(BuildContext context) {
    final crossAxis = CrossAxisAlignment.start;
    final mainAxis = MainAxisAlignment.center;

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: crossAxis,
          mainAxisAlignment: mainAxis,
          children: [
            Icon(Icons.cancel),
          ],
        ),
      ),
      color: color,
    );
  }
}
