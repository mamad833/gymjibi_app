import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/navigation.dart';
import 'package:gymjibi/screens/drawer/drawer.dart';
import 'package:gymjibi/screens/home/components/category.dart';
import 'package:gymjibi/screens/home/components/fast_booking.dart';
import 'package:gymjibi/screens/home/components/special_offers.dart';
import 'package:gymjibi/screens/map.dart';
import 'package:gymjibi/search/search_form.dart';
import 'package:intl/intl.dart';

import '../../calender_min_app.dart';
import '../../config/hive_service/hive_service.dart';
import '../register.dart';
import 'components/map_collection.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

DateTime? currentBackPressTime;

// DateTime timeBackPressed = DateTime.now();

class _HomescreenState extends State<Homescreen> {
  ScrollPhysics physics = const AlwaysScrollableScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final DateTime now = DateTime.now();
        final Duration backButtonPressInterval = const Duration(seconds: 2);

        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > backButtonPressInterval) {
          currentBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,

              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              backgroundColor: Colors.grey.shade700,
              // padding: EdgeInsets.only(bottom: 30),
              margin: const EdgeInsets.symmetric(
                vertical: 42.0,
                horizontal: 20,
              ),
              // content: Center(child: Text("برای خروج دکمه بازگشت را دوباره بزنید",style: Body_XL.copyWith(color: Colors.white),)),
              content: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Container(
                      child: Center(
                          child: Text(
                    "برای خروج دوباره بازگشت را بزنید",
                    style: bodyXL.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ))),
                ],
              ),
              duration: backButtonPressInterval,
            ),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: cf9,
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: SvgPicture.asset("assets/icons/menu.svg", color: black),
              ),
            );
          }),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  // Login22.bottomSheetLogin(context);
                  // tt1.bottomSheetLogin(context);
                  //
                  Register.bottomSheetEnterNumber(
                    context,
                  );
                },
                child: SvgPicture.asset(
                  "assets/icons/login.svg",
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Center(
            child: Image(
              width: 130,
              height: 130,
              image: AssetImage(
                "assets/images/home/logo.png",
              ),
            ),
          ),
        ),
        drawer: Drawer1(),
        body: SingleChildScrollView(
          physics: physics,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 56.h, bottom: 56.h, right: 20, left: 20),
                child: SearchForm(),
              ),
              const Category(),
              SizedBox(
                height: 56.h,
              ),
              const Special_offers(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 58.h, horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    //محمد
                    // Get.to(() => const ShowCollectionMap());
                    DateTime endDateOfLastWeek = getEndDateOfLastWeek();
                    DateFormat dateFormat = DateFormat.yMd(); // Date format

                    print('End date of last week: ${dateFormat.format(endDateOfLastWeek)}');
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image(
                          fit: BoxFit.cover,
                          height: 110,
                          image: AssetImage(
                            "assets/images/home/btn_map.png",
                          ),
                        ),
                      ),
                      Text(
                        "نمایش مجموعه‌ها  روی نقشه",
                        style: h4.copyWith(),
                      )
                    ],
                  ),
                ),
              ),
              //محمد
              // FastBooking(),
              CalenderMinApp(callBack: (int index) {  }, selectDate: (DateTime value) {  },),
              const SizedBox(
                height: 120,
              ),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(index: 0),
      ),
    );
  }
  DateTime getEndDateOfLastWeek() {
    DateTime now = DateTime.now();

    DateTime endDateOfLastWeek = now.subtract(Duration(days: now.weekday + 6)); // End of the last week

    return endDateOfLastWeek;
  }
}
