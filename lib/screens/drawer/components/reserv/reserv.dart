import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/screens/drawer/components/reserv/components/item_reserv.dart';
import 'package:gymjibi/screens/textFiled.dart';

class Reserv extends StatefulWidget {
  const Reserv({Key? key}) : super(key: key);

  @override
  State<Reserv> createState() => _ReservState();
}

class _ReservState extends State<Reserv> {
  bool _isPlay = false;
  late AnimationController _controller;

  bool _buttonState = false;

  int isIndex = 0;

  bool btn1 = false;
  bool btn2 = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: white
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
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
                          "جستجو در رزرو ها",
                          style: bodyXL,
                        )),
                    IconButton(
                      icon: AnimatedSwitcher(
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
                      onPressed: () {
                        setState(() {
                          _buttonState = !_buttonState;
                        });
                      },
                    ),
                  ],
                ),
                AnimatedContainer(
                  height: _buttonState ? 50 : 0,
                  color: white,
                  duration: Duration(milliseconds: _buttonState ? 300 : 200),
                  child:TextFieldWidget(
                    labelText: "شماره رزرو",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Item_Reserv(),
        ],
      ),
    );
  }
}
