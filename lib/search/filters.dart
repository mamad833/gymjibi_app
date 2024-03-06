import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/screens/collections/collections.dart';
import 'package:gymjibi/search/filters/attributes.dart';
import 'package:gymjibi/search/filters/city.dart';
import 'package:gymjibi/search/filters/date.dart';
import 'package:gymjibi/search/filters/fast_booking.dart';
import 'package:gymjibi/search/filters/price.dart';
import 'filters/category.dart';
import 'package:get/get.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});


  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool deletefiltersbtn = false;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
         // height: 580,
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: white,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GestureDetector(onTap:(){Get.back();},child: Icon(Icons.close,color: black,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "فیلتر ها",
                      style: h3,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          deletefiltersbtn=true;
                        });
                      },
                      child: Text(
                        "حذف فیلترها",
                        style: bodySMb,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Category(),
                Container(margin: EdgeInsets.symmetric(vertical: 15),width: double.infinity,height: 0.5,color: cde.withOpacity(0.5),),
                City(),
                Container(margin: EdgeInsets.symmetric(vertical: 15),width: double.infinity,height: 0.5,color: cde.withOpacity(0.5),),
                Price(),
                Container(margin: EdgeInsets.symmetric(vertical: 15),width: double.infinity,height: 0.5,color: cde.withOpacity(0.5),),
                Date(deletefilter: deletefiltersbtn),
                Container(margin: EdgeInsets.symmetric(vertical: 15),width: double.infinity,height: 0.5,color: cde.withOpacity(0.5),),
                Fast_booking(deletefilters: deletefiltersbtn),
                Container(margin: EdgeInsets.symmetric(vertical: 15),width: double.infinity,height: 0.5,color: cde.withOpacity(0.5),),
                Attributes(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            // Navigator.pop(context,Transition.downToUp,);
            /*Get.back(
                // transition: Transition.downToUp,duration: Duration(milliseconds: 4000)
            );*/
            Get.offAll(Collections.new,
                transition: Transition.fade,
              duration: Duration(milliseconds: 800)
            );


          },
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('نمایش مجموعه ها', style: bodyXL),
                const Icon(Icons.keyboard_arrow_up)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


