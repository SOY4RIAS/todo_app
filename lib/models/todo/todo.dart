import 'package:flutter/material.dart';
part './constants.dart';

class Todo {
  int id;
  String title;
  bool done;

  Todo({this.id, this.title, this.done = false}) {
    id = id ?? UniqueKey().hashCode;
  }

  bool toggleDone() => done = !done;

  _TodoStatus get status {
    return _TODO_STATUS[done];
  }
}

class TodoList {
  final List<Todo> _items;

  TodoList(this._items);

  int get length => _items.length;

  void addTodo(String title) {
    _items.add(Todo(id: _newID(), title: title));
  }

  Todo getItem(int index) {
    return _items[index];
  }

  void removeItem(int index) {
    _items.removeAt(index);
  }

  int _newID() => _items.last.id + 1;
}
