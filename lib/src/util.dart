// util funcs
import 'package:flutter/material.dart';

final String appName = "Todo";
final Gradient pinkToOrangeGradient = new LinearGradient(
  colors: [
    const Color.fromARGB(255, 232, 96, 122),
    const Color.fromARGB(255, 238, 182, 98),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp
);

final Gradient blueToGrayTealGradient = new LinearGradient(
  colors: [
    const Color.fromARGB(255, 0, 147, 233),
    const Color.fromARGB(255, 128, 208, 199),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp
);

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
