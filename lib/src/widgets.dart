import 'package:flutter/material.dart';

import 'package:todo_flutter/src/models.dart';
import 'package:todo_flutter/src/util.dart';

// simply a display container, stateless
class TodoListSummary extends StatelessWidget {
  final TodoList todoList;

  TodoListSummary({
    this.todoList
  });

  @override
  Widget build(BuildContext context) {
      return new Expanded(
        child: new Container(
          padding: EdgeInsets.all(defaultPadding/2),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // # of tasks text
              new StreamBuilder<int>(
                stream: todoListBloc.todoCount,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return new Text("Error: ${snapshot.error}");
                  }
                  return new Text(
                    "${snapshot.data} Tasks",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  );
                }
              ),
              // list name text
              new StreamBuilder(
                stream: todoListBloc.name,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return new Text("Error: ${snapshot.error}");
                  }
                  if (snapshot.data != null) {
                    return new Text(
                      snapshot.data,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500
                      ),
                    );
                  }
                  else {
                    return new Text("Empty name.");
                  }
                },
              )
            ],
          ),
        )
      );
    }
}