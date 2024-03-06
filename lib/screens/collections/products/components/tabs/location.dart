import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gymjibi/constants.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("موقعیت مکانی",style: h4,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Image(image: AssetImage(
              "assets/images/home/test/map.png",
            ),),
          ),
        ],
      ),
    );
  }
}
