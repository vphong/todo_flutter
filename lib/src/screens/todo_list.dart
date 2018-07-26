import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:todo_flutter/src/bloc/todo_list.dart';
import 'package:todo_flutter/src/models.dart';
import 'package:todo_flutter/src/util.dart';

const double _padding = 25.0;

class TodoListScreen extends StatefulWidget {

  @override
  _TodoListScreenState createState() => new _TodoListScreenState(); 
} 

class _TodoListScreenState extends State<TodoListScreen> {
  TodoListBloc _todoListBloc = new TodoListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _todoListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // make sure body fills space with Expanded
    var body = new Expanded(
      flex: 1,
      child: new Container(
        padding: EdgeInsets.only(left: _padding, right: _padding, bottom: _padding*2),
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

    return new TodoListProvider(
      todoListBloc: _todoListBloc,
      child: new Container( // container for gradient bg
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
      )
    );
  }
}

class SplashInfo extends StatelessWidget {

  final Profile _user = Profile();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListTileTheme(
        textColor: Colors.white,
        child: new ListTile(
          title: new Text(
            "Hello, ${_user.name}.", 
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500
            ),
          ),
          subtitle: const Text("Cool."),
        ),
      ),
    );
  }
}

class TodoListCard extends StatelessWidget {

  // final TodoList _list = new TodoList();

  @override
  Widget build(BuildContext context) {

    TodoListBloc todoListBloc = TodoListProvider.of(context).todoListBloc;

    var _todoListIcon =
//    new ShaderMask(
//      shaderCallback: (_) {
//        return pinkToOrangeGradient.createShader(_);
//        },
//      blendMode: BlendMode.modulate,
      new Icon(Icons.check, color: Colors.grey,);
    // new StreamBuilder(
    //   stream: todoListBloc.iconData,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       print("error");
    //       return new Text("Error: ${snapshot.error}");
    //     }
//    );

    var todoListCardBar = new Container(
      padding: EdgeInsets.all(_padding/2),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize:  MainAxisSize.min,
        children: <Widget>[
          
          new Expanded(
            flex: 1,
            // expanded container
            child: new Align(
              alignment: Alignment.centerLeft,
              child: _todoListIcon,
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.grey,),
        ],
      )
    );

    var todolistInfoContainer = new Expanded(
      child: new Container(
        padding: EdgeInsets.all(_padding/2),
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
            todoListCardBar,
            todolistInfoContainer,
            // new RaisedButton(
            //   child: const Text("Add a todo"),
            //   onPressed: () {
            //     todoListBloc.addTodo.add(new Todo());
            //   },
            // ),
            // new RaisedButton(
            //   child: const Text("Remove a todo"),
            //   onPressed: () {
            //     todoListBloc.addTodo.remove();
            //   },
            // ),
            // TODO: progress indicator
            new Container(
              padding: EdgeInsets.all(_padding),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // progress bar

                  // new StreamBuilder(
                  //   stream: todoListBloc.todoCount,
                  //   builder: (context, snapshot) {

                  //     if (snapshot.hasError) {
                  //       return new Text("Error: ${snapshot.error}");
                  //     }

                  //     if (snapshot.data != null) {
                  //       return new Text("Data: ${snapshot.data}");
                  //       // return new LinearProgressIndicator(
                  //       //   value: .5,
                  //       //   backgroundColor: Colors.grey,
                  //       //   // valueColor: Colors.pink,
                  //       // );
                  //     }
                  //     else return new Text("");
                  //   },
                  // )
                  // percent text
                ],
              )
            )
            
          ],
        )
      ),
    );
  }
}

// TODO: TodoListCardBar
