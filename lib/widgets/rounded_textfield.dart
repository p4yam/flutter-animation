import 'package:flutter/material.dart';


class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key key,
    this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 24,bottom: 24),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: const Color(0xffbdc3c7),
          boxShadow: [
            BoxShadow(offset:Offset.fromDirection(0.05),
            color: const Color(0xffbdc3c7),
            blurRadius:3,spreadRadius: 1 )
          ],
          border: Border.all(color: const Color(0xff7f8c8d))
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12,right: 12),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: const TextStyle(
                  color: const Color(0xff2c3e50),
                  fontSize: 19
              )
            ),
            style: const TextStyle(
              color: const Color(0xff2c3e50),
              fontSize: 19
            ),
          ),
        ),
      ),
    );
  }
}