import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';

class Category extends StatefulWidget {
  bool deletefilters = false;
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> with TickerProviderStateMixin {
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

  final noti =[
    CheckboxStat(title: 'سالن',),
    CheckboxStat(title: 'پینت بال'),
    CheckboxStat(title: 'زمین ساحلی'),
    CheckboxStat(title: 'زمین چمن'),
    CheckboxStat(title: 'استخر'),
  ];

  @override
  Widget build(BuildContext context) {
    return
    Column(
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
                child: Text("دسته بندی",style: bodyXL,)
            ),
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
                      ? Icon(Icons.keyboard_arrow_up,color: Colors.black ,key: const ValueKey('icon1'))
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
          height: _buttonState ?310:0,
          color: white,
          duration: Duration(milliseconds:_buttonState ?00:00),
        child: ListView(
          physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(12),
            children: [
              ...noti.map(buildCheckBox).toList(),
            ]
        ),
        ),
      ],
    );

  }

  buildCheckBox(CheckboxStat Checkbox) =>
      Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: c75,
        ),

        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(Checkbox.title,style: bodyLG,),
          activeColor: cMain.withOpacity(0.4),
          checkColor: cMain,

          value: Checkbox.value,
          onChanged: (value){
            setState(() {
              Checkbox.value = value!;
            });
          },
        ),
      );

}

class CheckboxStat{
  final String title;
  bool value;

  CheckboxStat({
    required this.title,
    this.value = false,
  });
}

