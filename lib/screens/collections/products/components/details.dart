// ignore_for_file: prefer_const_declarations, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gymjibi/constants.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Details extends StatefulWidget {
  final bool enabled;
  final String description;
  final String name;
  final num rate;

  final num priceStart;
  final num discountPrice;

  final String city;
  final num reservedCount;
  final String timeSans;
  final String gender;
  final num? minBookPersonCount;
  final num? maxBookPersonCount;
  final String address;
  final String category;

  const Details({
    super.key,
    required this.description,
    required this.name,
    required this.rate,
    required this.priceStart,
    required this.discountPrice,
    required this.city,
    required this.reservedCount,
    required this.timeSans,
    required this.gender,
    required this.minBookPersonCount,
    required this.maxBookPersonCount,
    required this.address,
    required this.enabled,
    required this.category,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  timeSansChar() {
    if (widget.timeSans == "1:00") return "یک ساعت";
    if (widget.timeSans == "1:30") return "یک ساعت و نیم";
    if (widget.timeSans == "2:00") return "دوساعت";
  }

  num? discountPercent;

  @override
  void initState() {
    if (widget.discountPrice != 0) {
      discountPercent =
          (((widget.priceStart - widget.discountPrice) / widget.priceStart) *
                  100)
              .toInt();
      print('درصد تخفیف: $discountPercent%');
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    price() {
      if (widget.discountPrice == 0) {
        print('قیمت عادی: ${widget.priceStart}');
        return Text(
          widget.priceStart.toString().seRagham(),
          style: bodyLG,
        );
      } else {
/*        print('درصد تخفیف: $discountPercent%');
        discountPercent = (((priceStart - discountPrice) / priceStart) * 100);
        print('درصد تخفیف: $discountPercent%');*/

        print('قیمت تخفیف خورده: ${widget.discountPrice}');
        return Text(
          widget.discountPrice.toString().seRagham(),
          style: bodyLG,
        );
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(widget.name, style: h3)),
                      widget.enabled
                          ? widget.discountPrice != 0
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: redBack,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Text(
                                    "${discountPercent.toString()}"
                                    "%"
                                    " تخفیف",
                                    style: h5.copyWith(color: redText),
                                  ),
                                )
                              : const SizedBox()
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xffFFED01),
                      ),
                      Text(
                        widget.rate.toString(),
                        style: TextStyle(
                            fontSize: 12, color: c75, fontFamily: dana),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      // Text("(216)",style: TextStyle(fontSize: 8,color: c75,fontFamily: dana),),
                    ],
                  ),
                ]),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/location_s.svg",
                    color: c75, height: 18),
                SizedBox(width: 8),
                Expanded(child: Text(widget.address, style: bodyMD)),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 0.5,
            color: b01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "در شهرِ",
                              style: bodySM,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/map.svg"),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  widget.city,
                                  style: bodyLG,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 0.5,
                        height: 58,
                        color: b01,
                      ),
                      widget.enabled
                          ? Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "قیمت",
                                          style: bodySM,
                                        ),
                                        widget.discountPrice != 0
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 3.0),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Text(
                                                      widget.priceStart
                                                          .toString()
                                                          .seRagham(),
                                                      style: h6.copyWith(
                                                          color: ccb),
                                                    ),
                                                    Transform.rotate(
                                                      angle: -0.15,
                                                      child: Container(
                                                        width: 56,
                                                        height: 1,
                                                        color: c75,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/icons/dollar.svg"),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        price(),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        SvgPicture.asset(
                                          "assets/icons/toman.svg",
                                          height: 14,
                                          width: 18,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: Wrap(
                                  children: [
                                    Text(
                                      "این مجموعه قابل رزرو نمی‌باشد!",
                                      textAlign: TextAlign.center,
                                      style: bodySM.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              )),
                      Container(
                        width: 0.5,
                        height: 58,
                        color: b01,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "تعداد رزرو",
                              style: bodySM,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.reservedCount.toString(),
                                  style: bodyLG,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                SvgPicture.asset("assets/icons/ticket.svg"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                  color: b01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "جنسیت",
                            style: bodySM,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/man.svg"),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                widget.gender == "Male"
                                    ? "آقایان"
                                    : widget.gender == "Female"
                                        ? "بانوان"
                                        : widget.gender == "Both"
                                            ? "آقایان و بانوان"
                                            : widget.gender,
                                style: bodyLG,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 58,
                        color: b01,
                      ),
                      Column(
                        children: [
                          Text(
                            "مدت هر سانس",
                            style: bodySM,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.timeSans == "1:00"
                                    ? "یک ساعت"
                                    : widget.timeSans == "1:30"
                                        ? "یک ساعت و نیم"
                                        : widget.timeSans == "2:00"
                                            ? "دو ساعت"
                                            : widget.timeSans,
                                style: bodyLG,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              SvgPicture.asset(
                                "assets/icons/clock.svg",
                                color: cMain,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.5,
                  color: b01,
                ),
                const SizedBox(
                  height: 15,
                ),
                DescriptionTextWidget(text: widget.description),
                widget.category != "pool"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "● حداقل تعداد بازیکنان : ${widget.minBookPersonCount.toString()}نفر",
                            style: bodyMD,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            "● حداکثر تعداد بازیکنان : ${widget.maxBookPersonCount.toString()}نفر",
                            style: bodyMD,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      )
                    : const SizedBox(),

                // Text(maxBookPersonCount.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({super.key, required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: bodyMD,
              textAlign: TextAlign.justify,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                  style: bodyMD,
                  textAlign: TextAlign.justify,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "بیشتر" : "کمتر",
                        style: buttonSM,
                      ),
                      Icon(
                        flag
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: cMain,
                        size: 21,
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
