import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/screens/collections/products/components/chip.dart';
import 'package:gymjibi/screens/collections/products/components/tabs/continue_reservation.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../../data/single_gym/model/response/respose_single_gym.dart';

class Sans extends StatefulWidget {
  final String? category;
  final poolDetails;
  final List<PriceTable> priceTable;
  final String nameGym;
  final String totalPrice;
  final int disCount;
  final String id;

  final List<AdditionalProducts> lsFeature;

  Sans({
    required this.category,
    required this.poolDetails,
    required this.lsFeature,
    required this.totalPrice,
    required this.disCount,
    required this.nameGym,
    required this.priceTable,
    required this.id,
  });

  @override
  State<Sans> createState() => _SansState();
}

class _SansState extends State<Sans> {
  String? currentDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String selectDateTime = DateFormat("yyyy/MM/dd").format(DateTime.now());

  ScrollbarThemeData _customScrollbarTheme(Color color) {
    return ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all<Color>(color),
      trackColor: MaterialStateProperty.all<Color>(cde),
    );
  }

  late StreamController<DateTime> _weekDatesController;
  ScrollController _scrollController = ScrollController();
  List<DateTime> weekDates = [];

  String convertMiladiToShamsi({required int month, required int day}) {
    DateTime miladiDate = DateTime(DateTime.now().year, month, day);

    Jalali jalaliDate = Jalali.fromDateTime(miladiDate);

    return '${jalaliDate.month}/${jalaliDate.day}';
  }

  int indexSelect = 8;
  String selectDayWeek = "";

  String getDayOfWeekInPersianFromPersianDate({required Jalali shamsiDate}) {
    int dayOfWeekIndex =
        shamsiDate.weekDay - 1; // The index of Persian days is 0-based

    List<String> persianDaysOfWeek = [
      'شنبه',
      'یکشنبه',
      'دوشنبه',
      'سه‌شنبه',
      'چهارشنبه',
      'پنجشنبه',
      'جمعه'
    ];

    return persianDaysOfWeek[dayOfWeekIndex];
  }

  bool enable = true;

  List<String> lsSat = [];
  List<String> lsSun = [];
  List<String> lsMon = [];
  List<String> lsTue = [];
  List<String> lsWed = [];
  List<String> lsThu = [];
  List<String> lsFri = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectDayWeek =
        DateFormat.E().format(DateTime.now()).substring(0, 3).toLowerCase();
    DateTime now = DateTime.now();
    int weekday = now.weekday;

    DateTime startDate = now.subtract(Duration(days: weekday + 1));
    _weekDatesController = StreamController<DateTime>.broadcast();

    Timer.periodic(const Duration(days: 1), (timer) {
      DateTime currentDate = DateTime.now();
      if (currentDate.weekday == 1 && currentDate.day != startDate.day) {
        startDate = currentDate;
        _weekDatesController.add(startDate);
      }
    });
    for (int i = 0; i < 7; i++) {
      DateTime date = startDate.add(Duration(days: i));
      weekDates.add(DateTime.parse(DateFormat("yyyy-MM-dd").format(date)));
    }
    for (int i = 0; i < widget.priceTable.length; i++) {
      if (widget.priceTable[i].day == "sat") {
        lsSat.add(widget.priceTable[i].period);
      } else if (widget.priceTable[i].day == "sun") {
        lsSun.add(widget.priceTable[i].period);
      } else if (widget.priceTable[i].day == "mon") {
        lsMon.add(widget.priceTable[i].period);
      } else if (widget.priceTable[i].day == "tue") {
        lsTue.add(widget.priceTable[i].period);
      } else if (widget.priceTable[i].day == "wed") {
        lsWed.add(widget.priceTable[i].period);
      } else if (widget.priceTable[i].day == "thu") {
        lsThu.add(widget.priceTable[i].period);
      } else if (widget.priceTable[i].day == "fri") {
        lsFri.add(widget.priceTable[i].period);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 6);
    DateTime endTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 30);

    // while (currentTime.isBefore(endTime)) {
    //   timeList.add(currentTime);
    //   currentTime = currentTime
    //       .add(Duration(minutes: 90)); // فاصله زمانی 1.5 ساعت را اضافه می‌کنیم
    // }

    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "سانس ها",
            style: h4,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "سانس مورد نظرت رو انتخاب کن",
            style: bodyLGd,
          ),
          SizedBox(
            height: 16.h,
          ),
          widget.category != "pool"
              ? Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: cde),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "روز هفته:",
                          style: bodyXLm,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
                        child: FDottedLine(
                          color: cde,
                          width: double.infinity,
                          strokeWidth: 1.0,
                          dottedLength: 10.0,
                          space: 5.0,
                        ),
                      ),
                      // dash line

                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 15),
                        child: SizedBox(
                          height: 85.h,
                          child: ScrollbarTheme(
                            data: _customScrollbarTheme(b02),
                            child: Scrollbar(
                              controller: _scrollController,
                              thumbVisibility: true,
                              interactive: true,
                              trackVisibility: true,
                              thickness: 4.h,
                              radius: Radius.circular(12),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 8.0.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (index == 0) {
                                            setState(() {
                                              selectDayWeek = 'sat';
                                            });
                                          } else if (index == 1) {
                                            setState(() {
                                              selectDayWeek = 'sun';
                                            });
                                          } else if (index == 2) {
                                            setState(() {
                                              selectDayWeek = 'mon';
                                            });
                                          } else if (index == 3) {
                                            setState(() {
                                              selectDayWeek = 'tue';
                                            });
                                          } else if (index == 4) {
                                            setState(() {
                                              selectDayWeek = 'wed';
                                            });
                                          } else if (index == 5) {
                                            setState(() {
                                              selectDayWeek = 'thu';
                                            });
                                          } else if (index == 6) {
                                            setState(() {
                                              selectDayWeek = 'fri';
                                            });
                                          }

                                          setState(() {
                                            indexSelect = index;
                                            currentDate = null;
                                          });
                                          selectDateTime =
                                              DateFormat('yyyy/MM/dd')
                                                  .format(weekDates[index]);

                                          DateFormat format =
                                              DateFormat('yyyy/MM/dd');
                                          DateTime dateTime =
                                              format.parse(selectDateTime);
                                          if (dateTime
                                              .isBefore(DateTime.now())) {
                                            enable = false;
                                          } else {
                                            enable = true;
                                          }
                                          if (dateTime ==
                                              DateTime(
                                                  DateTime.now().year,
                                                  DateTime.now().month,
                                                  DateTime.now().day)) {
                                            enable = true;
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6.h),
                                          height: 65.h,
                                          width: 96.w,
                                          decoration: BoxDecoration(
                                              color: indexSelect == index ||
                                                      currentDate ==
                                                          DateFormat('yyyy/MM/dd').format(
                                                              weekDates[index])
                                                  ? cMain.withOpacity(.05)
                                                  : null,
                                              border: Border.all(
                                                  width: 1,
                                                  color: indexSelect == index ||
                                                          currentDate ==
                                                              DateFormat(
                                                                      'yyyy/MM/dd')
                                                                  .format(
                                                                      weekDates[
                                                                          index])
                                                      ? b02
                                                      : cde),
                                              borderRadius:
                                                  BorderRadius.circular(16.r)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                getDayOfWeekInPersianFromPersianDate(
                                                    shamsiDate:
                                                        Jalali.fromDateTime(
                                                            weekDates[index])),
                                                style: bodyLG.copyWith(
                                                    color: indexSelect ==
                                                                index ||
                                                            currentDate ==
                                                                DateFormat(
                                                                        'yyyy/MM/dd')
                                                                    .format(
                                                                        weekDates[
                                                                            index])
                                                        ? cMain
                                                        : black),
                                              ),
                                              Text(
                                                convertMiladiToShamsi(
                                                  month: int.parse(
                                                      DateFormat('MM').format(
                                                          weekDates[index])),
                                                  day: int.parse(
                                                    DateFormat('dd').format(
                                                      weekDates[index],
                                                    ),
                                                  ),
                                                ),
                                                style: bodySMbl.copyWith(
                                                    color: indexSelect ==
                                                                index ||
                                                            currentDate ==
                                                                DateFormat(
                                                                        'yyyy/MM/dd')
                                                                    .format(
                                                                        weekDates[
                                                                            index])
                                                        ? cMain
                                                        : black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: 1,
                        color: cde,
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                        child: Text(
                          "ساعت شروع سانس:",
                          style: bodyXLm,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: FDottedLine(
                          color: cde,
                          width: double.infinity,
                          strokeWidth: 1.0,
                          dottedLength: 10.0,
                          space: 5.0,
                        ),
                      ),
                      // dash line

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Wrap(
                          children: selectDayWeek == "sat"
                              ? lsSun
                                  .map((e) => ChipCustom(
                                        enable: enable,
                                        totalPrice: widget.totalPrice,
                                        disCount: widget.disCount,
                                        lsFeature: widget.lsFeature,
                                        nameGym: widget.nameGym,
                                        selectDateTime: selectDateTime,
                                        text: e,
                                        day: selectDayWeek,
                                        id: widget.id,
                                      ))
                                  .toList()
                              : selectDayWeek == "sun"
                                  ? lsSun
                                      .map((e) => ChipCustom(
                                            enable: enable,
                                            totalPrice: widget.totalPrice,
                                            disCount: widget.disCount,
                                            lsFeature: widget.lsFeature,
                                            nameGym: widget.nameGym,
                                            selectDateTime: selectDateTime,
                                            text: e,
                                            day: selectDayWeek,
                                            id: widget.id,
                                          ))
                                      .toList()
                                  : selectDayWeek == "mon"
                                      ? lsSun
                                          .map((e) => ChipCustom(
                                                enable: enable,
                                                totalPrice: widget.totalPrice,
                                                disCount: widget.disCount,
                                                lsFeature: widget.lsFeature,
                                                nameGym: widget.nameGym,
                                                selectDateTime: selectDateTime,
                                                text: e,
                                                day: selectDayWeek,
                                                id: widget.id,
                                              ))
                                          .toList()
                                      : selectDayWeek == "tue"
                                          ? lsSun
                                              .map((e) => ChipCustom(
                                                    enable: enable,
                                                    totalPrice:
                                                        widget.totalPrice,
                                                    disCount: widget.disCount,
                                                    lsFeature: widget.lsFeature,
                                                    nameGym: widget.nameGym,
                                                    selectDateTime:
                                                        selectDateTime,
                                                    text: e,
                                                    day: selectDayWeek,
                                                    id: widget.id,
                                                  ))
                                              .toList()
                                          : selectDayWeek == "wed"
                                              ? lsSun
                                                  .map((e) => ChipCustom(
                                                        enable: enable,
                                                        totalPrice:
                                                            widget.totalPrice,
                                                        disCount:
                                                            widget.disCount,
                                                        lsFeature:
                                                            widget.lsFeature,
                                                        nameGym: widget.nameGym,
                                                        selectDateTime:
                                                            selectDateTime,
                                                        text: e,
                                                        day: selectDayWeek,
                                                        id: widget.id,
                                                      ))
                                                  .toList()
                                              : selectDayWeek == "thu"
                                                  ? lsSun
                                                      .map((e) => ChipCustom(
                                                            enable: enable,
                                                            totalPrice: widget
                                                                .totalPrice,
                                                            disCount:
                                                                widget.disCount,
                                                            lsFeature: widget
                                                                .lsFeature,
                                                            nameGym:
                                                                widget.nameGym,
                                                            selectDateTime:
                                                                selectDateTime,
                                                            text: e,
                                                            day: selectDayWeek,
                                                            id: widget.id,
                                                          ))
                                                      .toList()
                                                  : selectDayWeek == "fri"
                                                      ? lsSun
                                                          .map((e) =>
                                                              ChipCustom(
                                                                enable: enable,
                                                                totalPrice: widget
                                                                    .totalPrice,
                                                                disCount: widget
                                                                    .disCount,
                                                                lsFeature: widget
                                                                    .lsFeature,
                                                                nameGym: widget
                                                                    .nameGym,
                                                                selectDateTime:
                                                                    selectDateTime,
                                                                text: e,
                                                                day:
                                                                    selectDayWeek,
                                                                id: widget.id,
                                                              ))
                                                          .toList()
                                                      : [],
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () => Get.to(ContinueReservation.new),
                    child: Image.network(
                      widget.poolDetails,
                      errorBuilder: (context, error, stackTrace) {
                        print("error :: $error");
                        print("error ::: ${widget.poolDetails}");
                        return Text("error $error");
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
