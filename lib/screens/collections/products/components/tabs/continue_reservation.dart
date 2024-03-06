import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';
import 'package:get/get.dart';
import 'package:gymjibi/data/booked_api/logic/state/booked_state.dart';
import 'package:gymjibi/data/booked_api/logic/view_model/booked_view_model.dart';
import 'package:gymjibi/helper/custom_button.dart';
import 'package:gymjibi/screens/textFiled.dart';

import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../../../../data/single_gym/model/response/respose_single_gym.dart';

class ContinueReservation extends StatefulWidget {
  final String date;
  final String time;
  final String nameGym;
  final String totalPrice;
  final int disCount;

  final String id;
  final String day;
  final String period;

  final List<AdditionalProducts> lsFeature;

  ContinueReservation({
    required this.date,
    required this.nameGym,
    required this.disCount,
    required this.totalPrice,
    required this.lsFeature,
    required this.time,

    required this.period,
    required this.day,
    required this.id,
  });

  @override
  State<ContinueReservation> createState() => _ContinueReservationState();
}

class _ContinueReservationState extends State<ContinueReservation> {
  final controllerDiscountCode = TextEditingController();
  final bookedViewModel = BookedViewModel();
  bool showError = false;

  var now = JDate.now();

  // int collectionPrice = 200000;
  // int discountPrice = 20000;
  int totalPrice = 0;
  DateFormat format = DateFormat('yyyy/MM/dd');

  int countPeople = 0;
  List<int>? countItem;

  bool deleteContinueReservationbtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countItem = List.generate(widget.lsFeature.length, (index) => index);
    print(
      "USER Select this time=>${widget.date}",
    );
    widget.disCount != 0
        ? totalPrice = widget.disCount
        : totalPrice = int.parse(widget.totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset("assets/icons/exit.svg"),
            ),
          ),
          title: Text(
            "تکمیل و تایید اطلاعات",
            style: h4,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(convertMiladiToShamsi(
                      month: format.parse(widget.date).month,
                      day: format.parse(widget.date).day)),
                  Text(widget.time),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                widget.nameGym,
                style: h5,
              ),
              SizedBox(
                height: 8,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: cf9, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(
                    //   "مهلت استفاده",
                    //   style: h6.copyWith(fontSize: 19.sp),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "از امروز ",
                    //       style: bodySM,
                    //     ),
                    //     Text(
                    //       '${now.day} / ${now.month}',
                    //       style: bodyLGd.copyWith(fontSize: 19.sp),
                    //     ),
                    //     Text(
                    //       " تا ",
                    //       style: bodySM,
                    //     ),
                    //     Text(
                    //       '${now.add(Duration(days: 14)).day} / ${now.add(Duration(days: 14)).month}',
                    //       style: bodyLGd.copyWith(fontSize: 19.sp),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 6,
                    // ),
                    Column(
                      children: [
                        Text(
                          "تعداد نفرات",
                          style: h6,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 108,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (countPeople > 0) countPeople--;
                                    // totalPrice = (countPeople) +
                                    //     collectionPrice;
                                  });
                                },
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                      color: (countPeople > 0)
                                          ? cMain.withOpacity(0.5)
                                          : cMain.withOpacity(0.35),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove_rounded,
                                    color: (countPeople > 0)
                                        ? cMain
                                        : cMain.withOpacity(0.6),
                                  )),
                                ),
                              ),
                              Text(
                                "$countPeople",
                                style: bodyXL,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    countPeople++;
                                    // totalPrice = (countPeople) +
                                    //     collectionPrice;

                                    //totalPrice = (priceItemPeople*countPeople)+totalPrice;
                                  });
                                },
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                      color: cMain.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Icon(
                                    Icons.add_rounded,
                                    color: cMain,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 32,
              ),
              Text(
                "ویژگی های اضافه",
                style: h5,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                    itemCount: widget.lsFeature.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 6),
                              decoration: BoxDecoration(
                                  color: cf9,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "تعداد${widget.lsFeature[index].title}",
                                    style: h6,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            print(countItem![index]);
                                            setState(() {
                                              if (countItem![index] > 0) {
                                                countItem![index]--;
                                                totalPrice -= ((1 *
                                                    widget.lsFeature[index]
                                                        .price));
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: 26,
                                            width: 26,
                                            decoration: BoxDecoration(
                                                color: (countItem![index] > 0)
                                                    ? cMain.withOpacity(0.5)
                                                    : cMain.withOpacity(0.35),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                                child: Icon(
                                              Icons.remove_rounded,
                                              color: (countItem![index] > 0)
                                                  ? cMain
                                                  : cMain.withOpacity(0.6),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          "${countItem![index]}",
                                          style: bodyXL,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              countItem![index]++;
                                              totalPrice += (1 *
                                                  widget
                                                      .lsFeature[index].price);

                                              //totalPrice = (priceItemPeople*countPeople)+totalPrice;
                                            });
                                          },
                                          child: Container(
                                            height: 26,
                                            width: 26,
                                            decoration: BoxDecoration(
                                                color: cMain.withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                                child: Icon(
                                              Icons.add_rounded,
                                              color: cMain,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Expanded(
              //             child: TextFieldWidget(
              //               controller: controllerDiscountCode,
              //               labelText: "کد تخفیف",
              //               // inputTextDirection: TextDirection.ltr,
              //               textAlign: TextAlign.end,
              //             ),
              //           ),
              //           // Padding(
              //           //   padding: EdgeInsets.only(right: 12.0),
              //           //   child: GestureDetector(
              //           //     onTap: () {
              //           //       setState(() {
              //           //         showError = true;
              //           //       });
              //           //     },
              //           //     child: Container(
              //           //       // width: 70,
              //           //       padding: EdgeInsets.symmetric(
              //           //           vertical: 8, horizontal: 10),
              //           //       decoration: BoxDecoration(
              //           //         color: white,
              //           //         border: Border.all(width: 1, color: cMain),
              //           //         borderRadius: BorderRadius.circular(8),
              //           //       ),
              //           //       child: Center(
              //           //           child: Text(
              //           //         "اعمال کد",
              //           //         style: buttonSM,
              //           //       )),
              //           //     ),
              //           //   ),
              //           // ),
              //         ],
              //       ),
              //       showError
              //           ? Padding(
              //               padding: const EdgeInsets.only(top: 8, right: 10),
              //               child: Text(
              //                 "کد تایید با موفقیت اعمال شد",
              //                 style: bodyXSg,
              //               ),
              //             )
              //           : SizedBox()
              //     ],
              //   ),
              // ),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: FDottedLine(
                    strokeWidth: 1,
                    color: ccb,
                    dottedLength: 8.0,
                    space: 3.0,
                    corner: FDottedLineCorner.all(16.0),

                    /// add widget
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 16.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "مجموع:",
                                style: h6,
                              ),
                              Text(
                                "${widget.totalPrice}",
                                style: bodyXL,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "قیمت با تخفیف:",
                                style: h6,
                              ),
                              Text(
                                "${widget.disCount}",
                                style: bodyXL,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "قابل پرداخت:",
                                style: h6,
                              ),
                              Text(
                                "$totalPrice",
                                style: bodyXL,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              // SizedBox(height: 32,),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Get.back();
                  print(widget.lsFeature.length);
                },
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Center(
                      child: Text(
                    "بستن",
                    style: buttonSM,
                  )),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //
              //   },
              //   child: Container(
              //     // width: 90,
              //     height: 40,
              //     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              //     decoration: BoxDecoration(
              //       color: cMain,
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: Center(
              //         child: Text(
              //       "",
              //       style: buttonSMw,
              //     )),
              //   ),
              // ),
              BlocBuilder(
                  bloc: bookedViewModel,
                  builder: (context, state) {
                    return MyCustomButton(
                      onTap: () {
                        bookedViewModel.booked(
                            id: widget.id,
                            day: widget.day,
                            date: widget.date,
                            period: widget.period,
                            personsCount:countPeople,
                            additionalProduct: widget.lsFeature);
                      },
                      title: "تایید و ادامه",
                      loading: state is BookedLoadingState,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  String convertMiladiToShamsi({required int month, required int day}) {
    DateTime miladiDate = DateTime(DateTime.now().year, month, day);

    Jalali jalaliDate = Jalali.fromDateTime(miladiDate);

    return '${jalaliDate.month}/${jalaliDate.day}';
  }
}
