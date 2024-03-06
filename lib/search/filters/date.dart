import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:time_range_picker/time_range_picker.dart';


class Date extends StatefulWidget {

  bool deletefilter = false;
  Date({required this.deletefilter});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {


  bool _isPlay = false;
  late AnimationController _controller;

  var _datestart;
  var _dateend;
  var _timestart;
  var _timeend;
  bool _buttonState = false;

  int isIndex = 0;

  bool btn1 = false;
  bool btn2 = false;

  @override
  Widget build(BuildContext context) {
    void selectDateRange () async {
      final picked = await showPersianDateRangePicker(
        context: context,
        initialEntryMode: PDatePickerEntryMode.input,
        initialDateRange: JalaliRange(
          start: Jalali.now(),
          end: Jalali.now(),
        ),
        firstDate: Jalali.now(),
        lastDate: Jalali(1450, 12),

      );
      setState(() {
        _datestart=picked!.start.toString();
        print(_datestart);
        print(picked);
        _dateend=picked.end.toString();
        print(_dateend);
      });
    }
    void selectTimeRange () async {
      TimeRange result = await showTimeRangePicker(
          context: context,

          interval: const Duration(minutes: 15),
          start: TimeOfDay.now(),
          autoAdjustLabels: true,
          //backgroundColor: Colors.yellow,
          activeTimeTextStyle: h6,
          timeTextStyle: h6,
          strokeColor: cMain.withOpacity(0.7),
          handlerColor: cMain,
          selectedColor: cMain,

          strokeWidth: 5,
          handlerRadius: 9,
          //disabledTime: TimeRange(startTime: TimeOfDay(hour: 10, minute: 55), endTime: TimeOfDay(hour: 12, minute: 55)),
          hideTimes: false,
          use24HourFormat: true,
          useRootNavigator: false,
          toText: "تا",
          fromText: "از",

          disabledColor: Colors.red.withOpacity(0.5),
          ticks: 24,
          ticksOffset: -15,
          ticksLength: 15,
          ticksColor: Colors.grey,
          labels: [
            "24",
            "3",
            "6",
            "9",
            "12",
            "15",
            "18",
            "21"
          ].asMap().entries.map((e) {
            return ClockLabel.fromIndex(
                idx: e.key, length: 8, text: e.value);
          }).toList(),
          labelOffset: -28,
          rotateLabels: false,
          padding: 36

      );
      setState(() {
        _timestart=result.startTime.toString();
        _timeend=result.endTime.toString();

      });
      print("result " + result.toString());
    }
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
                  "محدوده زمانی",
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
          //padding: EdgeInsets.symmetric(vertical: 15),
         // margin: EdgeInsets.symmetric(vertical: 0),
         //  height: _buttonState ? 270 : 0,
          color: white,
          duration: Duration(milliseconds: _buttonState ? 300 : 200),
          child: Column(
            children: [
              Text("تاریخ",style: bodyMD,),
              GestureDetector(
                onTap: selectDateRange,
                child: Row(
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
                          _datestart!=null?
                          Text(_datestart.toString().substring(7,_datestart.toString().length-10).replaceAll(',', '/'),style: bodyXS,textDirection: TextDirection.ltr):Text(""),

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
                          _dateend!=null?
                          Text(_dateend.toString().substring(7,_dateend.toString().length-10).replaceAll(',', '/'),style: bodyXS,textDirection: TextDirection.ltr):Text(""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: selectDateRange,
                style: ElevatedButton.styleFrom(
                  primary: cMain,
                ),
                child: Text('انتخاب تاریخ',style: buttonSMw,),
              ),
              SizedBox(height: 6,),
              Text("ساعت",style: bodyMD,),
              GestureDetector(
                onTap: selectTimeRange,
                child: Row(
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
                          _timestart!=null?
                          Text(_timestart.toString().substring(10,_timestart.length-1),style: bodyXS,):Text(""),
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
                          _timeend!=null?
                          Text(_timeend.toString().substring(10,_timeend.length-1),style: bodyXS,):Text(""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: selectTimeRange,
                style: ElevatedButton.styleFrom(
                  primary: cMain,
                ),
                child: Text('انتخاب ساعت',style: buttonSMw,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

