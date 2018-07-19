import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../util.dart';
import '../models.dart';

const double _padding = 25.0;

class TodoListScreen extends StatefulWidget {
  // final Data state;
  _TodoListScreenState createState() => new _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  final TodoList _todoList;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          appBar,
          new Container(
            child: new Column(
              children: <Widget>[
                new SplashInfo(),
                new TodoListCard()
              ],
            ),
            padding: EdgeInsets.all(_padding),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        gradient: pinkToOrangeGradient,
      ),
    );
  }
}

class SplashInfo extends StatelessWidget {

  Profile _user = Profile();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListTileTheme(
        textColor: Colors.white,
        child: new ListTile(
          title: new Text(_user.name),
          subtitle: const Text("Cool."),
        ),
      ),
    );
  }
}

class TodoListCard extends StatelessWidget {

  TodoList _list = new TodoList();

  @override
  Widget build(BuildContext context) {

    return new Container(
      constraints: new BoxConstraints(
        maxHeight: 300.0,
        minWidth: MediaQuery.of(context).size.width * 0.9,
      ),
      child: new Card(
        elevation: 10.0,
        margin: EdgeInsets.only(right: _padding/2.0, left: _padding/2.0),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)
        ),
        child: new Column(
          children: <Widget>[
            new Text(_list.todosCount + " Tasks"),
            new Text(_list.name),
          ],
          mainAxisSize: MainAxisSize.max,
        ),
      ),
    );

    // return new Column(
    //   // width: MediaQuery.of(context).size.width - _padding,
    //   children: <Widget>[
    //     new Expanded(
    //       child: new Card(
    //         elevation: 10.0,
    //         margin: EdgeInsets.only(right: _padding/2.0, left: _padding/2.0),
    //         shape: new RoundedRectangleBorder(
    //           borderRadius: new BorderRadius.circular(8.0)
    //         ),
    //         child: new Column(
    //           children: <Widget>[
    //             new Text(_list.todosCount + " Tasks"),
    //             new Text(_list.name),
    //           ],
    //           mainAxisSize: MainAxisSize.max,
    //         ),
    //       ),
        
    //     )

    //   ],
    // );
  }
}
