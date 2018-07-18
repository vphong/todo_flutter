import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../util.dart';

class TodoListsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBar appBar = new AppBar(
      title: new Text(
        appName.toUpperCase(), 
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          letterSpacing: 1.0,
          color: Colors.white
        ),
      ),
      // TODO: navigation icons
      backgroundColor: new Color.fromRGBO(0, 0, 0, 0.0),
      elevation: 0.0,
    );

    return new Container(
      child: new Column(
        children: <Widget>[
          appBar,
        ],
      ),
      decoration: new BoxDecoration(
        gradient: blueToGrayTealGradient,
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     appBar: new AppBar(
  //       title: new Text(appName.toUpperCase(), 
  //         style: const TextStyle(
  //           fontFamily: 'Raleway',
  //           fontWeight: FontWeight.bold,
  //           fontSize: 14.0,
  //           letterSpacing: 1.0,
  //           color: Colors.black
  //         ),
  //       ),
  //       // TODO: navigation icons
  //       backgroundColor: new Color.fromRGBO(0, 0, 0, 0.0),
  //       elevation: 0.0,
  //     ),
  //     body: new TodoListBody(),
  //   );
  // }
}

class TodoListBody extends StatelessWidget {
  // build a carousel of all TodoLists
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new CarouselSlider(
        items: [1,2,3,4,5].map((i) {
            return new Builder(
              builder: (BuildContext context) {
                return new TodoList();
              },
            );
          }).toList(),
          viewportFraction: 1.0,
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
          
        ),
      );
    
    
  }
}


class TodoListState extends State<TodoList> {
  // final todos = [];
  // final String name;
  // final Icon icon;


  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        gradient: blueToGrayTealGradient,
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => new TodoListState();
}

class Todo {
  bool complete;
  String id;
  String note;
  String task;
}

// class GradientAppBar extends StatelessWidget {
//   final String title;
//   final double barHeight = 66.0;

//   GradientAppBar(this.title);

//   @override
//   Widget build(BuildContext context) {

//     final double statusBarHeight = MediaQuery
//       .of(context)
//       .padding
//       .top;

//     return new Container(
//       padding: new EdgeInsets.only(top: statusBarHeight),
//       height: statusBarHeight + barHeight,
//       decoration: new BoxDecoration(
//         gradient: blueToGrayTeal
//       ),
//       child: new Center(
//         child: new Text(title.toUpperCase(),
//           style: const TextStyle(
//             color: Colors.white,
//             fontFamily: 'SF Pro Display',
//             fontWeight: FontWeight.w300,
//             fontSize: 16.0,
//           ),
//         ),
//       )
//     );
//   }
// }