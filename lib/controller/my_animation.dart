import 'dart:async';

import 'package:flutter/material.dart';
class MyAnimation extends StatefulWidget {
  Widget child;
  int time;
  MyAnimation({Key? key , required this.child , required this.time}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> with SingleTickerProviderStateMixin {
  //créattion d'un ticker "SingleTickerProviderMixin" qui fait office d'un métronome

  //variable qui gère la durée et le comportement dans le temps de l'animation
  late AnimationController _controller;
  late Animation<Offset> animationOffset;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 5500)
    );
    //le comportement de l'animation
    CurvedAnimation animationCurved = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    //indiquer ou commence et finisse l'animation dans l'espace
    animationOffset = Tween(
      begin: const Offset(2.0, 5.0),
      end: Offset.zero
    ).animate(animationCurved);
    Timer(Duration(seconds: widget.time ), () {
      _controller.forward();
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        //opacité de notre widget
        opacity: _controller,
      child: SlideTransition(
          //geestion de l'opacité
          position: animationOffset,
        //Sur quel élément on veut appliquer l'animation
        child: widget.child,
      ),
    );
  }
}
