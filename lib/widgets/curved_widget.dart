import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CurvedCar extends StatelessWidget {
  final double width;
  final Animation controller;
  const CurvedCar({this.width,Key key, this.controller});


  @override
  Widget build(BuildContext context) {
    return  AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      bottom: (width / 2.5) + (controller.value/5),
      left: 0,
      right: 0,
      child: Image.asset(
        'images/pickup-car.png',
        width: 100,
        height: 100,
      ),
    );
  }

}