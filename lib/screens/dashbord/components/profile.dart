import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';

class Profile extends StatelessWidget {
  final String? urlImage;
  final String? nameUser;

  Profile({ this.urlImage,  this.nameUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [
          /*BoxShadow(
            color: Color(0xffCFDAED).withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius:10,
            offset: Offset(0,0), // changes position of shadow
          ),*/
        ],
        color: white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: urlImage != null
                  ? DecorationImage(
                      image: NetworkImage(urlImage!),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image: AssetImage(
                        "assets/images/home/test/profile.png",
                      ),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "سلام $nameUser عزیز  👋",
                style: h6,
              ),
              Text(
                "دوشنبه، ۱۴ آذر ۱۴۰۱",
                style: bodyXS,
              ),
              // Text("۰۹:۱۹ ق.ظ",style: bodyXS,),
            ],
          )
        ],
      ),
    );
  }
}
