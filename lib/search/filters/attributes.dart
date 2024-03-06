import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';

class Attributes extends StatefulWidget {
  @override
  State<Attributes> createState() => _AttributesState();
}

class _AttributesState extends State<Attributes> {
  bool _isPlay = false;
  late AnimationController _controller;

  bool _buttonState = false;

  int isIndex = 0;

  bool btn1 = false;
  bool btn2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    _buttonState = !_buttonState;
                  });
                },
                child: Text(
                  "ویژگی‌ها",
                  style: bodyXL,
                )),
            GestureDetector(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, anim) =>
                      RotationTransition(
                        turns: child.key == ValueKey('icon1')
                            ? Tween<double>(begin: 0.5, end: 1).animate(anim)
                            : Tween<double>(begin: 1, end: 0.5).animate(anim),
                        child: ScaleTransition(scale: anim, child: child),
                      ),
                  child: _buttonState
                      ? Icon(Icons.keyboard_arrow_up,
                      color: Colors.black, key: const ValueKey('icon1'))
                      : Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.black,
                    key: const ValueKey('icon2'),
                  )),
              onTap: () {
                setState(() {
                  _buttonState = !_buttonState;
                });
              },
            ),
          ],
        ),
        if(_buttonState)
          AnimatedContainer(
          // height: _buttonState ? 50 : 0,
          color: white,
          duration: Duration(milliseconds: _buttonState ? 300 : 200),
          //child:,
        ),
      ],
    );
  }
}

