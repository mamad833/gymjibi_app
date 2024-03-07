import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymjibi/screens/collections/products/components/tabs/continue_reservation.dart';

import '../../../../constants.dart';
import '../../../../data/single_gym/model/response/respose_single_gym.dart';

class ChipCustom extends StatefulWidget {
  final String selectDateTime;
  final String nameGym;
  final String totalPrice;
  final int disCount;
  final List<AdditionalProducts> lsFeature;
  final bool enable;
  final String text;
  final String id;
  final String day;
  final bool status;


  const ChipCustom({
    required this.enable,
    required this.totalPrice,
    required this.disCount,
    required this.lsFeature,
    required this.nameGym,
    required this.selectDateTime,
    required this.text,
    required this.day,
    required this.id, required this.status,
  });

  @override
  State<ChipCustom> createState() => _ChipCustomState();
}

class _ChipCustomState extends State<ChipCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7, bottom: 7),
      child: GestureDetector(
        onTap: () {
          if (widget.enable&&widget.status==false) {
            Get.to(
              ContinueReservation(
                date: widget.selectDateTime,
                nameGym: widget.nameGym,
                disCount: widget.disCount,
                totalPrice: widget.totalPrice,
                lsFeature: widget.lsFeature,
                time: widget.text,
                day:widget.day,
                id:widget.id,
                period:widget.text,
              ),
            );
          }
          /*showDialog(
                              context: context,
                              builder: (context) => ContinueReservation(),
                            );*/
        },
        child: Container(
          width: 84.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: widget.enable ? Colors.white : cf9,
            border: Border.all(width: 1, color: cde),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
              child: Text(
            widget.enable
                ? widget.status?"رزرو شده":widget.text.substring(0, 5).replaceAll(" -", "0")
                : "گذشته",
            style: bodyXL.copyWith(color: widget.enable ? widget.status?Colors.red:black : ccb),
          )),
        ),
      ),
    );
  }
}
