import 'package:flutter/cupertino.dart';

class MovingCloud extends StatelessWidget {
  final double width;
  final Animation controller;
  const MovingCloud({this.width,Key key, this.controller});


  @override
  Widget build(BuildContext context) {

    return  AnimatedPositioned(
      duration: Duration(seconds: 15),
      bottom: width/1.5,
      left: -100+controller.value*1000,
      child: Image.asset(
        'images/clouds.png',
        width: 100,
        height: 100,
      ),
    );
  }

}