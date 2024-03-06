import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/navigation.dart';
import 'package:gymjibi/screens/home/home_screen.dart';
import 'package:gymjibi/screens/weblog/weblog_description/search_weblog.dart';
import 'package:gymjibi/screens/weblog/weblog_description/weblog_description.dart';
import 'package:get/get.dart';

class Weblog extends StatefulWidget {
  const Weblog({Key? key}) : super(key: key);

  @override
  State<Weblog> createState() => _WeblogState();
}

class _WeblogState extends State<Weblog> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        // برگرداندن به صفحه خانه
        Get.offAll(Homescreen.new,transition: Transition.noTransition);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20,right: 4,left: 4),
              child: SearchWeblog(),
            ),
          ),
        ),
        backgroundColor: cf9,
        extendBody: true,
        bottomNavigationBar: BottomNavBar(index: 3),
        body: Container(
          margin: const EdgeInsets.only(bottom: 30, top: 5),
          // height: height/2,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            //scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Get.to(()=>Weblog_Description());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffCFDAED).withOpacity(0.5),
                          spreadRadius: 1.5,
                          blurRadius: 10,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      color: white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    width: width - 65,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.width / 2 - 45,
                                width: MediaQuery.of(context).size.width,
                                image: const AssetImage(
                                  "assets/images/home/test/weblog.png",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text("معروف ترین داور های دنیا",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontFamily: anjoman,
                                  fontWeight: FontWeight.w900,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "سلام خدمت اعضای دوست داشتنی جیم جیبی امروز براتون مقاله‌ای آوردم به نام معروف ترین داور های دنیا که قصد داریم 5 تا از بهترین و معروف ترین داور های ایران و دنیا رو بهتون معرفی کنم.",
                              style: TextStyle(
                                color: c75,
                                fontSize: 14,
                                fontFamily: dana,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              //width: width/3,
                              decoration: BoxDecoration(
                                color: b01,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                  child: Text(
                                "3" + " نفر نظر دادن",
                                style: TextStyle(
                                    color: b03, fontFamily: dana, fontSize: 12),
                              )),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Text(
                                    "۱۴۰۱ - ۶ - ۲۴",
                                    style: TextStyle(
                                        color: b03,
                                        fontFamily: dana,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    //width: width/3,
                                    decoration: BoxDecoration(
                                      color: b01,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "معرفی",
                                      style: TextStyle(
                                          color: b03,
                                          fontFamily: dana,
                                          fontSize: 12),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
