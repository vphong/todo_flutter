import 'package:flutter/material.dart';

import 'package:todo_flutter/src/bloc/todo_list.dart';
import 'package:todo_flutter/src/models.dart';
import 'package:todo_flutter/src/util.dart';
import 'package:todo_flutter/src/widgets.dart';


class ListInfoScreen extends StatelessWidget {
  final TodoListBloc todoListBloc;

  ListInfoScreen({
    this.todoListBloc
  });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

      // TODO: implement build
      return new Container(
        width: screenSize.width,
        height: screenSize.height,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(defaultPadding),
        color: Colors.white,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // new Text("hello"),
            new Hero(
              tag: 'listInfo',
              child: new Card(
                elevation: 0.0,
                child: new TodoListSummary(todoListBloc: todoListBloc,),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: new Text("Go back"),
            )

             
          ],
        ),
      );
    }
}