

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';


class CalenderMinApp extends StatefulWidget {
  final Function(int index)callBack;
  final Function( DateTime value)selectDate;
  int?backgroundColor;

   CalenderMinApp({required this.callBack,required this.selectDate,this.backgroundColor});

  @override
  State<CalenderMinApp> createState() => _CalenderMinAppState();
}

class _CalenderMinAppState extends State<CalenderMinApp> {
  final ScrollController firstController = ScrollController();
  final ScrollController secondController = ScrollController();
  List<DateTime> weekDates = [];
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  // SelectItemViewModel selectDate = SelectItemViewModel();
  List<String> lsDay = [
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
  ];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  late StreamController<DateTime> _weekDatesController;

  final DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDate;

  List<String> lsDayBlock = [];
  List<String> lsDayEvent = [];
  int getNumberOfDaysInMonth(int monthNumber) {
    if (monthNumber < 1 || monthNumber > 12) {
      throw ArgumentError('شماره ماه باید بین ۱ تا ۱۲ باشد.');
    }

    DateTime dateTime = DateTime(DateTime.now().year, monthNumber + 1, 0);
    int daysInMonth = dateTime.day;
    return daysInMonth;
  }
  ///

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    widget.selectDate(DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now())));

    print(currentMonth);
    _selectedDate = _focusedDay;

    print(months[currentMonth - 1]);
    DateTime now = DateTime.now();
    int weekday = now.weekday;


    DateTime startDate = now.subtract(Duration(days: weekday - 1));
    _weekDatesController = StreamController<DateTime>.broadcast();

    Timer.periodic(const Duration(days: 1), (timer) {
      DateTime currentDate = DateTime.now();
      if (currentDate.weekday == 1 && currentDate.day != startDate.day) {
        startDate = currentDate;
        _weekDatesController.add(startDate);
      }
    });

    // Generate a list of dates for the week
    for (int i = 0; i < 7; i++) {
      DateTime date = startDate.add(Duration(days: i));
      weekDates.add(DateTime.parse(DateFormat("yyyy-MM-dd").format(date)));
    }

  }
  @override
  void dispose() {
    _weekDatesController.close();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 13.w, right: 13.w, top: 10.h, bottom: 10.h),
      width: 344.w,
      decoration:  BoxDecoration(
        color:widget.backgroundColor==1?Colors.white.withOpacity(0.09):Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [

          SizedBox(height: 35.h),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: weekDates.length,
              itemBuilder: (context, index) {

                DateTime date = weekDates[index];

                String formattedDate =
                DateFormat('dd').format(date);
                if (formattedDate ==
                    DateFormat('dd').format(DateTime.now())) {

                }
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: GestureDetector(
                    onTap: () {

                      // if(!lsDayBlock.contains(DateFormat('yyyy-MM-dd').format(date))){
                      //   setState(() {
                      //     _selectedDate=DateTime.parse(DateFormat('yyyy-MM-dd').format(date));
                      //   });
                      //   widget.selectDate(_selectedDate);
                      // }
                    },
                    child: Container(
                      width: 45,
                      decoration: BoxDecoration(
                        color: _selectedDate==DateTime.parse(DateFormat('yyyy-MM-dd').format(date))?Colors.green:Colors.transparent,
                        borderRadius: BorderRadius.circular(16.r),
                      ),

                      child: Container(
                        width: 45,
                        // height: 60,
                        decoration: BoxDecoration(
                          color: DateFormat('yyyy-MM-dd').format(date)==DateFormat('yyyy-MM-dd').format(DateTime.now())
                              ? Colors.green
                              : Colors.transparent,
                          borderRadius:
                          BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 2.5.h),
                            Text(
                              lsDay[index],
                              style: TextStyle().copyWith(
                                  fontSize: 12.sp,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              formattedDate,
                              style: TextStyle().copyWith(
                                fontSize: 16.sp,
                                color: Colors.red
                              ),
                            ),
                            SizedBox(height: 2.5.h),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
