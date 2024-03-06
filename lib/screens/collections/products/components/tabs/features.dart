import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/different_size_of_gridview_item.dart';

class Features extends StatelessWidget {
  final List<String> features;

  const Features({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    List<String> featuresFa = [];
    for (var feature in features) {
      switch (feature) {
        case 'parking':
          featuresFa.add('داشتن پارکینگ');
          break;
        case 'wc':
          featuresFa.add('دارای سرویس بهداشتی');
          break;
        case 'specialClothes':
          featuresFa.add('داشتن لباس مخصوص');
          break;
        case 'lockerRoom':
          featuresFa.add('داشتن رختکن');
          break;
        case 'cooler':
          featuresFa.add('داشتن کولر');
          break;
        case 'heater':
          featuresFa.add('داشتن بخاری');
          break;
        case 'SpectatorPosition':
          featuresFa.add('داشتن سکوی تماشاگر');
          break;
        case 'longTimeReservation':
          featuresFa.add('امکان رزرو سانس بلند مدت');
          break;
        case 'familyLodge':
          featuresFa.add('امکان برگذاری لژ خانوادگی');
          break;
        default:
          featuresFa.add(
              ""); // یا می‌توانید مقدار انگلیسی را اضافه کنید یا اینکه چیزی اضافه نکنید.
      }
    }

    /*for (String item in features){
      featuresFa = [
        item == "parking" ? "داشتن پارکینگ" : item,
        item == "wc" ? "دارای سرویس بهداشتی" : item,
        item == "specialClothes" ? "داشتن لباس مخصوص" : item,
        item == "lockerRoom" ? "داشتن رختکن" : item,
        item == "cooler" ? "داشتن کولر" : item,
        item == "heater" ? "داشتن بخاری" : item,
        item == "SpectatorPosition" ? "داشتن سکوی تماشاگر" : item,
        item == "longTimeReservation" ? "امکان رزرو سانس بلند مدت" : item,
        item == "familyLodge" ? "امکان برگذاری لژ خانوادگی" : item,

      ];
    }*/

    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "امکانات و ویژگی ها",
            style: h4,
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: GenerateChipe(
              texts: featuresFa,
              icons: Icon(Icons.add),
            ),

            /*Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/map.svg"),
                    Text("aa"),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/map.svg"),
                    Text("aa"),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/map.svg"),
                    Text("aa"),
                  ],
                ),
              ],
            ),*/
          ),
        ],
      ),
    );
  }
}
