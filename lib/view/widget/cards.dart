import 'package:flutter/material.dart';
// ----------cards for homeScreen
Widget customeCards(context,child,double minWidth,double maxWidth,double minHeight,double maxHeight,color){
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return ConstrainedBox(
    constraints: BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      minHeight: minHeight
    ),
    child: Card(
      color: color,
      child: Padding(padding: const EdgeInsets.all(8.0),
      child: child,
      ),
    ),
  );
}