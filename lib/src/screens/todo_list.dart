import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../util.dart';
import '../models.dart';

class TodoListScreen extends StatefulWidget {
  // final Data state;
  _TodoListScreenState createState() => new _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  final TodoList todoList;

  @override
  Widget build(BuildContext context) {
    return new Container();
  }

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