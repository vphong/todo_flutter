import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import 'package:todo_flutter/src/models.dart';

// create a provider so that the bloc 
// can be accessed anywhere in widget tree
class TodoListProvider extends InheritedWidget {
  final TodoListBloc todoListBloc;

  TodoListProvider({
    Key key,
    @required TodoListBloc todoListBloc,
    @required Widget child
  }) : todoListBloc = todoListBloc ?? TodoListBloc(),
      super(key: key, child: child);

  @override
  // whether or not to notify widgets that inherit from this widget
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  // fallback logic in case no widget in scope
  static TodoListProvider of(BuildContext context) {
    // will return null
    return context.inheritFromWidgetOfExactType(TodoListProvider);
  }
  
}

class TodoListBloc {
  static TodoList _todoList = new TodoList();

  // Output
  Observable<String> get name => _nameSubject.stream;
  final _nameSubject = BehaviorSubject<String>(seedValue:  _todoList.name);

  Stream<IconData> get iconData => _iconSubject.stream;
  final _iconSubject = BehaviorSubject<IconData>(seedValue: _todoList.iconData);

  // output: todos list
  // keep as <List<Todo>> to keep list info - length, order, etc.
  // Observable aka Stream
  Stream<List<Todo>> get todos => _todosSubject.stream;
  final _todosSubject = BehaviorSubject<List<Todo>>();

  Stream<int> get todoCount => _todoCountSubject.stream;
  final _todoCountSubject = BehaviorSubject<int>(seedValue: 0);

  // input stream, accessed externally
  Sink<Todo> get addTodo => _addTodoSubject.sink;
  // helper for input stream - send data, error, done events
  final _addTodoSubject = BehaviorSubject<Todo>();

  
  TodoListBloc() {
    // _nameSubject.stream.listen((name) {
    //   // _todoList.updateName(name);
    // });

    // listen for addTodo function
    _addTodoSubject.stream.listen((addedTodo) {
      // actually modify the TodoList
      _todoList.add(addedTodo);
      _todoCountSubject.add(_todoList.todoCount);
    });
  }

  // close all inputs - Sinks/Observables
  void close() {
    addTodo.close();
  }


}

class TodoBloc {
  Todo _todo;

  Observable<Todo> get updateTodo => _updateTodoController.stream;
  BehaviorSubject<Todo> _updateTodoController = BehaviorSubject<Todo>();

  TodoBloc() {
    _updateTodoController.stream.listen((data) {

    });
  }
}