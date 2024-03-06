import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gymjibi/constants.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image(
                width: 105.w,
                height: 105.r,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/home/hall.png",
                ),
              ),
              SizedBox(height: 5.h,),
              Text("سالن",style: TextStyle(fontFamily: dana,),),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 105.w,
                height: 105.r,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/home/paint-ball.png",
                ),
              ),
              SizedBox(height: 5.h,),
              Text("پینت بال",style: TextStyle(fontFamily: dana,),),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 105.w,
                height: 105.r,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/home/pool.png",
                ),
              ),
              SizedBox(height: 5.h,),
              Text("استخر",style: TextStyle(fontFamily: dana,),),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 105.w,
                height: 105.r,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/home/grass.png",
                ),
              ),
              SizedBox(height: 5.h,),
              Text("چمن",style: TextStyle(fontFamily: dana,),),
            ],
          ),
        ],
      ),
    );
  }
}
