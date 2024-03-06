import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/navigation.dart';
import 'package:gymjibi/screens/weblog/weblog_description/components/picweblog.dart';
import 'package:gymjibi/screens/weblog/weblog_description/components/subject.dart';


class Weblog_Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      backgroundColor: cf9,
      bottomNavigationBar: BottomNavBar(index: 3,),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {Get.back();
            },
            child:SvgPicture.asset("assets/icons/exit.svg"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child:SvgPicture.asset("assets/icons/share.svg",),
                ),
                SizedBox(width: 15,),
                GestureDetector(
                  onTap: (){},
                  child:SvgPicture.asset("assets/icons/more.svg",),
                ),
              ],
            ),
          ),
        ],

        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            PicWeblog(),
            Subject(),
            SizedBox(height: 120,),

          ],
        ),
      ),
    );
  }
}
