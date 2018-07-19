import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// use uuid.v1 for time-based uuids, v4 for random
Uuid uuid = new Uuid();

class TodoList {
  
  final String _id = uuid.v1();
  String _name = "Todo";
  Icon _icon = new Icon(Icons.check_box);
  final List<Todo> _todos;

  // Creates an empty TodoList.
  TodoList();

  String get id => _id;

  // Name methods
  String get name => _name;
  set newName(String name) {
    _name = name;
  }

  ///// Icon methods
  Icon get icon => _icon;
  set newIcon(Icon icon) {
    _icon = icon;
  }

  ///// Todo methods
  List<Todo> get todos => _todos;

  set add(Todo todo) {
    _todos.add(todo);
  }

  set delete(Todo todo) {
    _todos.remove(todo);
  }

}

class Todo {
  final String id = uuid.v1();
  String name = "";
  String notes = "";
  bool complete = false;

  // Creates empty Todo.
  Todo();
}