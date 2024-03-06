import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){},
            child:  Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(16),bottomRight:Radius.circular(16)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/home/test/paint.png",),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("رزرو مجموعه",style: h5,),
                            Text("پینت‌بال پرواز",style: bodyXS,),
                          ],),
                      ],),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SvgPicture.asset(
                          "assets/icons/close_user.svg",
                        ),
                      ),
                    ],),
                ),
                SizedBox(height: 15,),
              ],
            ),
          );
        },
      ),
    );
  }
}
