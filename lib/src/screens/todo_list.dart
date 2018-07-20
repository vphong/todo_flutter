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
    final Size screenSize = MediaQuery.of(context).size;

    // make sure body fills space with Expanded
    var body = new Expanded(
      flex: 1,
      child: new Container(
        padding: EdgeInsets.all(_padding),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new SplashInfo(),
            new TodoListCard()
          ],
        ),
      ),
    );

    return new Container(// container for gradient bg
      width: screenSize.width,
      height: screenSize.height,
      child: new Column( // contains appBar + body column
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          appBar,
          body
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

    return new Expanded( // expanded to fill body space
      flex: 1,
      child: new Card(
        elevation: 10.0,
        margin: EdgeInsets.only(right: _padding/2.0, left: _padding/2.0),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(_list.todosCount + " Tasks"),
            new Text(_list.name),
          ],
        ),
      ),
    );
  }
}
