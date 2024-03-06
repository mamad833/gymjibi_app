import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';

class Statistics extends StatelessWidget {
  final int favorite;
  final int booked;
  final int comment;

  const Statistics({
    required this.booked,
    required this.favorite,
    required this.comment,
  }) ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [],
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width / 2 - 28.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "مورد علاقه‌ها",
                          style: bodySM,
                        ),
                        Text(
                          "$favorite مجموعه",
                          style: h6,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      "assets/icons/like.svg",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Container(
                color: cde,
                width: 0.5,
                height: 72,
              ),
              Container(
                width: width / 2 - 28,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      "assets/icons/comment.svg",
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "نظـــــــرات",
                          style: bodySM,
                        ),
                        Text(
                          "$comment کامنت",
                          style: h6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(color: cde, height: 0.5, width: width),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width / 2 - 28.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "تعداد رزرو‌ها",
                          style: bodySM,
                        ),
                        Text(
                          "$booked ســانس",
                          style: h6,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      "assets/icons/reservations.svg",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Container(
                color: cde,
                width: 0.5,
                height: 72,
              ),
              Container(
                width: width / 2 - 28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      "assets/icons/inventory.svg",
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "موجودی کیف پول",
                          style: bodySM,
                        ),
                        Text(
                          "۳۴۵٬۰۰۰",
                          style: h6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
