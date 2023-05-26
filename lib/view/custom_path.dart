import 'package:flutter/material.dart';

class CustomPath extends CustomClipper<Path>{
  //mise en place du chemin Path
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height *0.5);
    path.cubicTo(size.width/4, size.width/4, size.width/2, size.width/2, size.width, size.height/8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }


}