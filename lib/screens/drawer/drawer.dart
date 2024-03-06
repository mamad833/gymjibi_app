import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';
import 'package:get/get.dart';
import 'package:gymjibi/screens/dashbord/dashbord.dart';
import 'package:gymjibi/screens/drawer/components/account/account.dart';
import 'package:gymjibi/screens/drawer/components/account/Dashbord06.dart';
import 'package:gymjibi/screens/drawer/components/favorite/Dashbord04.dart';
import 'package:gymjibi/screens/drawer/components/main_dashbord/Dashbord01.dart';
import 'package:gymjibi/screens/drawer/components/notifications/Dashbord05.dart';
import 'package:gymjibi/screens/drawer/components/reserv/Dashbord02.dart';
import 'package:gymjibi/screens/drawer/components/transaction/Dashbord03.dart';
import 'package:gymjibi/screens/home/home_screen.dart';

class Drawer1 extends StatefulWidget {

  var btn;

  Drawer1({@required this.btn});

  @override
  State<Drawer1> createState() => _Drawer1State();
}


class _Drawer1State extends State<Drawer1> {
  bool btn1 = false;
  bool btn2 = false;
  bool btn3 = false;
  bool btn4 = false;
  bool btn5 = false;
  bool btn6 = false;
  bool btn7 = false;


  @override
  Widget build(BuildContext context) {
    widget.btn==1? btn1 = true:btn1 = false;
    widget.btn==2? btn2 = true:btn2 = false;
    widget.btn==3? btn3 = true:btn3 = false;
    widget.btn==4? btn4 = true:btn4 = false;
    widget.btn==5? btn5 = true:btn5 = false;
    widget.btn==6? btn6 = true:btn6 = false;

    final width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 50,
              child: Image(image: AssetImage("assets/images/home/logo.png"),),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-82,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Get.to(()=>Homescreen());
                        //Get.back();
                        //Navigator.pop(context, "You selccted the Option If");
                        setState(() {
                          btn1 = true;
                          if(btn1 == true){
                            Get.off(()=>Dashbord01());
                            btn7 = false;
                            btn6 = false;
                            btn5 = false;
                            btn3 = false;
                            btn2 = false;
                            btn4 = false;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:btn1 == false? Colors.transparent: b01.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16)),
                        ),
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(btn1 == false ?"assets/icons/home_d.svg":"assets/icons/home_d.svg",color:btn1 == false ? c75:cMain,),
                            SizedBox(width: 5,),
                            Text(
                              'صفحه اصلی پیشخوان',
                              style: btn1 == false ? bodyLGd:bodyLGs,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(color: b01,height: 0.5,width:width-132,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          btn2 = true;
                          if(btn2 == true){
                            Get.off(()=>Dashbord02());
                            btn7 = false;
                            btn6 = false;
                            btn5 = false;
                            btn3 = false;
                            btn4 = false;
                            btn1 = false;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:btn2 == false? Colors.transparent: b01.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16)),
                        ),
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 15),

                        child: Row(
                          children: [
                            SvgPicture.asset(btn2 == false ?"assets/icons/calendar_d.svg":"assets/icons/calendar_d.svg",color:btn2 == false ? c75:cMain,),
                            SizedBox(width: 5,),
                            Text(
                              'رزرو های من',
                              style: btn2 == false ? bodyLGd :bodyLGs,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(color: b01,height: 0.5,width:width-132,),
                    GestureDetector(
                      onTap: () {
                        Get.off(()=>Dashbord03());
                        setState(() {
                          btn3 = true;
                          if(btn3 == true){
                            btn7 = false;
                            btn6 = false;
                            btn5 = false;
                            btn4 = false;
                            btn2 = false;
                            btn1 = false;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:btn3 == false? Colors.transparent: b01.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16)),
                        ),
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(btn3 == false ?"assets/icons/wallet_d.svg":"assets/icons/wallet_d.svg",color:btn3 == false ? c75:cMain,),
                            SizedBox(width: 5,),
                            Text(
                              'تراکنش ها',
                              style: btn3 == false ? bodyLGd :bodyLGs,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(color: b01,height: 0.5,width:width-132,),
                    GestureDetector(
                      onTap: () {
                        Get.off(()=>Dashbord04());
                        setState(() {
                          btn4 = true;
                          if(btn4 == true){
                            btn7 = false;
                            btn6 = false;
                            btn5 = false;
                            btn3 = false;
                            btn2 = false;
                            btn1 = false;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:btn4 == false? Colors.transparent: b01.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16)),
                        ),
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(btn4 == false ?"assets/icons/heart_d.svg":"assets/icons/heart_d.svg",color:btn4 == false ? c75:cMain,),
                            SizedBox(width: 5,),
                            Text(
                              'علاقه مندی',
                              style: btn4 == false ? bodyLGd :bodyLGs,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(color: b01,height: 0.5,width:width-132,),
                    GestureDetector(
                      onTap: () {
                        Get.off(()=>Dashbord05());
                        setState(() {
                          btn5 = true;
                          if(btn5 == true){
                            btn7 = false;
                            btn6 = false;
                            btn4 = false;
                            btn3 = false;
                            btn2 = false;
                            btn1 = false;
                          }
                        });
                        // Update the state of the app.
                        // ...
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:btn5 == false? Colors.transparent: b01.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16)),
                        ),
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 15),

                        child: Row(
                          children: [
                            SvgPicture.asset(btn5 == false ?"assets/icons/notification_d.svg":"assets/icons/notification_d.svg",color:btn5 == false ? c75:cMain,),
                            SizedBox(width: 5,),
                            Text(
                              "اعلانات",
                              style: btn5 == false ? bodyLGd :bodyLGs,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(()=>Dashbord06());
                        setState(() {
                          btn6 = true;
                          if(btn6 == true){
                            btn7 = false;
                            btn5 = false;
                            btn4 = false;
                            btn3 = false;
                            btn2 = false;
                            btn1 = false;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:btn6 == false? Colors.transparent: b01.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16)),
                        ),
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(btn6 == false ?"assets/icons/profile_d.svg":"assets/icons/profile_d.svg",color:btn6 == false ? c75:cMain,),
                            SizedBox(width: 5,),
                            Text(
                              'حساب کاربری',
                              style: btn6 == false ? bodyLGd :bodyLGs,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(color: b01,height: 0.5,width:width-132,),
                    GestureDetector(
                      onTap: () {
                       // Get.to(()=>);
                        setState(() {
                          btn7 = true;
                          if(btn7 == true){
                            btn6 = false;
                            btn5 = false;
                            btn4 = false;
                            btn3 = false;
                            btn2 = false;
                            btn1 = false;
                          }
                        });
                        // Update the state of the app.
                        // ...
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:btn7 == false? Colors.transparent: b01.withOpacity(0.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16)),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 65,

                        child: Row(
                          children: [
                            SvgPicture.asset(btn7 == false ?"assets/icons/logout_d.svg":"assets/icons/logout_d.svg",color:btn7 == false ? c75:cMain,),
                            SizedBox(width: 5,),
                            Text(
                              "خروج",
                              style: btn7 == false ? bodyLGd :bodyLGs,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
