import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/curved_widget.dart';
import 'package:flutter_animations/widgets/movin_cloud.dart';
import 'package:flutter_animations/widgets/rounded_textfield.dart';
import 'package:flutter_animations/widgets/spinning_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _tweenController;
  Animation<double> _tweenAnimation;
  bool _isDay = true;
  final lightBgColors = [
    Color(0xFF8C2480),
    Color(0xFFCE587D),
    Color(0xFFFF9485),
  ];
  final darkBgColors = [
    Color(0xFF0D1441),
    Color(0xFF283584),
    Color(0xFF376AB2),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 40),
      vsync: this,
    )..repeat();

    _tweenController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat();

    _tweenAnimation =
        Tween<double>(begin: 0, end: 100).animate(_tweenController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xffecf0f1),
      appBar: AppBar(backgroundColor: const Color(0xff2d98da)),
      body: LayoutBuilder(builder: (_, dimensions) {
        return Stack(
          children: [
            SpinningContainer(
              controller: _controller,
              width: dimensions.maxWidth,
            ),
            CurvedCar(
              width: dimensions.maxWidth,
              controller: _tweenAnimation,
            ),
            MovingCloud(
              width: dimensions.maxWidth,
              controller: _controller,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: RoundedTextField(
                    hintText: 'Username',
                  ),
                ),
                RoundedTextField(
                  hintText: 'Password',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Row(
                    children: [
                      MaterialButton(
                        height: 48,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        minWidth: dimensions.maxWidth / 2,
                        color: const Color(0xff2d98da),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                      Spacer(),
                      MaterialButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Color(0xff130f40)),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
