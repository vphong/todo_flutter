import 'package:flutter/material.dart';
import 'src/screens/todoLists/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo',
      home: new Scaffold(
        body: new TodoListsScreen()
      ),
    );
  }
}


