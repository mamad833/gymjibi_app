import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gymjibi/config/hive_service/hive_service.dart';
import 'package:gymjibi/constants.dart';
import 'package:get/get.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:gymjibi/screens/drawer/components/main_dashbord/Dashbord01.dart';
import 'package:gymjibi/screens/map.dart';
import 'package:gymjibi/screens/register.dart';
import 'package:gymjibi/screens/weblog/weblog.dart';

import 'screens/collections/collections.dart';
import 'screens/dashbord/dashbord.dart';
import 'screens/home/home_screen.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  final index;
  final bgw;

  BottomNavBar({@required this.index, this.bgw});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final Style1 = TextStyle(color: cMain, fontSize: 12, fontFamily: yekan);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconButtonTheme: const IconButtonThemeData(),
        iconTheme: IconThemeData(color: cMain),
      ),
      child: CurvedNavigationBar(
        index: widget.index,
        onTap: (index) => setState(() {
          //this.index= index;
          print(index);

          if (index == 0) {
            Get.offAll(
                transition: Transition.noTransition, () => const Homescreen());
          } else if (index == 1) {
            Get.offAll(
                transition: Transition.noTransition, () => const Homescreen());
          } else if (index == 2) {
            Get.offAll(
                transition: Transition.noTransition, () => const Collections());
          } else if (index == 3) {
            Get.offAll(
                transition: Transition.noTransition, () => const Weblog());
          } else if (index == 4) {
            if (HiveServices.getToken == null) {
              Get.offAll(
                  transition: Transition.noTransition, () => const Homescreen());
              Register.bottomSheetEnterNumber(
                context,
              );
            } else {
              Get.offAll(
                  transition: Transition.noTransition, () => Dashbord01());
            }
          }
        }),
        iconPadding: 14,
        height: 68,
        color: cNavigation,
        buttonBackgroundColor: cNavigation,
        items: [
          CurvedNavigationBarItem(
            labelStyle: Style1,
            child: SvgPicture.asset((widget.index == 0)
                ? "assets/icons/home_s.svg"
                : "assets/icons/home.svg"),
            label: 'خانه',
          ),
          CurvedNavigationBarItem(
            labelStyle: Style1,
            child: SvgPicture.asset((widget.index == 1)
                ? "assets/icons/location_b.svg"
                : "assets/icons/location_s.svg"),
            label: 'نقشه',
          ),
          CurvedNavigationBarItem(
            labelStyle: Style1,
            child: SvgPicture.asset((widget.index == 2)
                ? "assets/icons/search_nav_s.svg"
                : "assets/icons/search_nav.svg"),
            label: 'مجموعه ها',
          ),
          CurvedNavigationBarItem(
            labelStyle: Style1,
            child: SvgPicture.asset((widget.index == 3)
                ? "assets/icons/weblog_s.svg"
                : "assets/icons/weblog.svg"),
            label: 'وبلاگ',
          ),
          CurvedNavigationBarItem(
            labelStyle: Style1,
            child: SvgPicture.asset((widget.index == 4)
                ? "assets/icons/user_s.svg"
                : "assets/icons/user.svg"),
            label: HiveServices.getToken != null ? "پروفایل" : 'ورود/ثبت نام',
          ),
        ],
        backgroundColor: (widget.bgw == 1) ? white : Colors.transparent,
        animationCurve: Curves.easeOut,
        animationDuration: const Duration(milliseconds: 0),
      ),
    );
  }
}
