
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpinningContainer extends AnimatedWidget {
  final double width;
  const SpinningContainer({this.width,Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -(width / 1.8),
      left: 0,
      right: 0,
      child: Transform.rotate(
        angle: _progress.value * 5.0 * math.pi,
        child: Image.asset('images/worldwide.png',width: width,height: width,),
      ),
    );
  }
}