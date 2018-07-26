import 'package:flutter/material.dart';

import 'package:todo_flutter/src/models.dart';


class ListInfoScreen extends StatelessWidget {
  final TodoList list;

  ListInfoScreen({
    this.list
  });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

      // TODO: implement build
      return new Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.white70,
        child: new Text("hello")
      );
    }
}