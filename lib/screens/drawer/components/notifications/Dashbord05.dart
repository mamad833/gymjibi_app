import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/screens/drawer/components/main_dashbord/Dashbord01.dart';
import 'package:gymjibi/screens/drawer/components/notifications/notifications.dart';
import 'package:gymjibi/screens/drawer/drawer.dart';
import 'package:gymjibi/navigation.dart';

import '../../../dashbord/components/profile.dart';


class Dashbord05 extends StatefulWidget{

  @override
  State<Dashbord05> createState() => _Dashbord05State();
}

class _Dashbord05State extends State<Dashbord05> {


      @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        // برگرداندن به صفحه خانه
        Get.offAll(Dashbord01.new,transition: Transition.noTransition);
        return true;
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: cf9,
        bottomNavigationBar: BottomNavBar(index: 4,),
        appBar: AppBar(
          toolbarHeight: 130,
          backgroundColor: Colors.transparent,
          elevation:0,
          leading: Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child:SvgPicture.asset("assets/icons/menu.svg",color:black ),
                  ),
                );
              }
          ),
          title: Row(
            children: [
                Profile(),
            ],
          ),
        ),
        drawer: Drawer1(btn: 5),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Notifications(),
            ],
          ),
        ),

      ),
    );
  }
}

