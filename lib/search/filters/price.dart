import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';

class Price extends StatefulWidget {
  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {

  bool _buttonState = false;

  int isIndex = 0;

  RangeValues _currentRangeValues = const RangeValues(0, 750000);

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
                  "محدوده قیمت",
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
          // height: _buttonState ? 100 : 0,
          color: white,
          duration: Duration(milliseconds: 300),
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: cf9,
                    border: Border.all(color: c75,width: 0.5),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("از",style: bodyXS,),
                      Row(children: [
                        Text(_currentRangeValues.start.round().toString(),style: bodyXL,),
                        SvgPicture.asset("assets/icons/toman.svg", ),
                      ],)

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: cf9,
                        border: Border.all(color: c75,width: 0.5),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("تا",style: bodyXS,),
                        Row(children: [
                          Text(_currentRangeValues.end.round().toString(),style: bodyXL,),
                          SvgPicture.asset("assets/icons/toman.svg", ),
                        ],)
                      ],
                    ),
                  ),
              ],),

              RangeSlider(
                values: _currentRangeValues,
                max: 750000,
                divisions: 150,
                activeColor: cMain,
                inactiveColor: c75,

                /*labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),*/
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),


            ],
          ),
        ),
      ],
    );
  }

}

