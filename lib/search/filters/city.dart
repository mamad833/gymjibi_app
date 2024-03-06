import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';

class City extends StatefulWidget {
  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> with TickerProviderStateMixin {
  bool _isPlay = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _buttonState = false;

  // var _currIndex = 0;
//  animate() => myAnimation.reversa();
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
                  "شهر‌ها",
                  style: bodyXL,
                )),
            GestureDetector(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, anim) => RotationTransition(
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
          // height: _buttonState ? 150 : 0,
          color: white,
          duration: Duration(milliseconds: _buttonState ? 300 : 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap: () {
                  setState(() {
                    if (btn1 == false) {
                      btn1 = true;
                    } else if (btn1 == true) {
                      btn1 = false;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: cMain,
                    ),
                    color: btn1 == false ? Colors.transparent : cMain,
                  ),
                  height: 48,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'یزد',
                          style: btn1 == false ? buttonLGb : buttonLG,
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (btn2 == false) {
                      btn2 = true;
                    } else if (btn2 == true) {
                      btn2 = false;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: cMain,
                    ),
                    color: btn2 == false ? Colors.transparent : cMain,
                  ),
                  height: 48,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'تهران',
                        style: btn2 == false ? buttonLGb : buttonLG,
                        ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  buildCheckBox(CheckboxStat Checkbox) => Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: c75,
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            Checkbox.title,
            style: bodyLG,
          ),
          activeColor: cMain.withOpacity(0.4),
          checkColor: cMain,
          value: Checkbox.value,
          onChanged: (value) {
            setState(() {
              Checkbox.value = value!;
            });
          },
        ),
      );
}

class CheckboxStat {
  final String title;
  bool value;

  CheckboxStat({
    required this.title,
    this.value = false,
  });
}
