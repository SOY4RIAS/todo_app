import 'package:flutter/material.dart';
part 'todo_status.dart';

class Todo {
  int? id;
  String title;
  bool done;

  Todo({this.id, required this.title, this.done = false}) {
    id = id ?? Todo._newID();
  }

  void toggleDone() {
    done = !done;
  }

  _TodoStatus get status => _TODO_STATUS[done]!;

  static int _newID() => UniqueKey().hashCode;
}

class TodoList {
  final List<Todo> _items;

  TodoList(this._items);

  int get length => _items.length;

  void addTodo(String title) {
    _items.add(Todo(title: title));
  }

  Todo getItemById(int id) => _items.firstWhere((item) => item.id == id);
  Todo getItemByIndex(int index) => _items[index];

  void removeItem(int id) => _items.removeWhere((item) => item.id == id);
}
