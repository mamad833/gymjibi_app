import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/screens/drawer/components/favorite/favorite.dart';
import 'package:gymjibi/screens/drawer/components/main_dashbord/Dashbord01.dart';
import 'package:gymjibi/screens/drawer/components/transaction/transaction.dart';
import 'package:gymjibi/screens/drawer/drawer.dart';
import 'package:gymjibi/navigation.dart';

import '../../../dashbord/components/profile.dart';


class Dashbord03 extends StatefulWidget{

  @override
  State<Dashbord03> createState() => _Dashbord03State();
}

class _Dashbord03State extends State<Dashbord03> {


      @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
        drawer: Drawer1(btn: 3),
        body: Padding(
          padding: const EdgeInsets.only(right:  20,left: 20,bottom: 120),
          child:Container(
            decoration: BoxDecoration(
              color: Color(0xffE7ECF6),
              borderRadius: BorderRadius.circular(24),
            ),
              padding: EdgeInsets.only(top: 7.5,bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("تاریخچه تراکنش ها",style: h4,),
                  SizedBox(height: 7.5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 58,
                        width: width/4-13,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(16),),
                        ),
                        child: Center(child: Text("تاریخ و ساعت",style: bodyLG,/*textAlign: TextAlign.justify,*/)),
                      ),
                      Container(
                        height: 58,
                        width: width/4-13,
                        decoration: BoxDecoration(
                          color: white,
                        ),
                        child: Center(child: Text("مبلغ",style: bodyLG,)),
                      ),
                      Container(
                        height: 58,
                        width: width/4-13,
                        decoration: BoxDecoration(
                          color: white,
                        ),
                        child: Center(child: Text("نوع تراکنش",style: bodyLG,)),
                      ),
                      Container(
                        height: 58,
                        width: width/4-13,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),),
                        ),
                        child: Center(child: Text("توضیحات",style: bodyLG,)),
                      ),

                    ],
                  ),
                  SizedBox(height: 4,),
                  Transaction(),
                  SizedBox(height: 4,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 58,
                    width: width/4-13,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),),
                    ),
                    child: Center(child: Text("تاریخ و ساعت",style: bodyLG,/*textAlign: TextAlign.justify,*/)),
                  ),
                  Container(
                    height: 58,
                    width: width/4-13,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Center(child: Text("مبلغ",style: bodyLG,)),
                  ),
                  Container(
                    height: 58,
                    width: width/4-13,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Center(child: Text("نوع تراکنش",style: bodyLG,)),
                  ),
                  Container(
                    height: 58,
                    width: width/4-13,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),),
                    ),
                    child: Center(child: Text("توضیحات",style: bodyLG,)),
                  ),

                ],
              ),
                ],
              )
          ),
        ),

      ),
    );
  }
}

