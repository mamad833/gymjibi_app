import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
 class SuccessReserve extends StatelessWidget {
   const SuccessReserve({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return SafeArea(child: Scaffold(
       body: Column(
         children: [
           SvgPicture.asset("assets/icons/clock.svg"),
           Text("زرو شما با موفقیت تایید شد")
         ],
       ),
     ));
   }
 }
 