import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class Weblog extends StatefulWidget {
  const Weblog({Key? key}) : super(key: key);

  @override
  State<Weblog> createState() => _WeblogState();
}

class _WeblogState extends State<Weblog> {

  double rating = 3 ;
  double value = 3;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text("وبلاگ",style: TextStyle(fontSize: 25,fontFamily: anjoman,color: black),),
        Container(
          margin: EdgeInsets.only(bottom: 32,top: 5),
          height: height/2,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffCFDAED).withOpacity(0.5),
                        spreadRadius: 1.5,
                        blurRadius:10,
                        offset: Offset(0,0), // changes position of shadow
                      ),
                    ],
                    color: white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(20)),
                  ),                  width: width - 65,
                  padding: EdgeInsets.all(15),
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
                              height: MediaQuery.of(context).size.width/2-45,
                              width: MediaQuery.of(context).size.width,
                              image: AssetImage(
                                "assets/images/home/test/weblog.png",
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                              "معروف ترین داور های دنیا",
                              style: TextStyle(
                                color: black,
                                fontSize: 18,
                                fontFamily: anjoman,
                                fontWeight: FontWeight.w900,
                              )
                          ),
                          SizedBox(height: 5,),
                          Text("سلام خدمت اعضای دوست داشتنی جیم جیبی امروز براتون مقاله‌ای آوردم به نام معروف ترین داور های دنیا که قصد داریم 5 تا از بهترین و معروف ترین داور های ایران و دنیا رو بهتون معرفی کنم."
                            ,style: TextStyle(
                              color: c75,
                              fontSize: 14,
                              fontFamily: dana,
                              fontWeight: FontWeight.w300,
                            ),),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(

                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            //width: width/3,
                            decoration: BoxDecoration(
                            color: b01,
                            borderRadius:
                            BorderRadius.all(Radius.circular(5)),
                          ),child: Center(child: Text("3"+" نفر نظر دادن",style: TextStyle(color: b03,fontFamily: dana,fontSize: 12),)),),

                          Container(padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text("۱۴۰۱ - ۶ - ۲۴",style: TextStyle(color: b03,fontFamily: dana,fontSize: 12),),
                                SizedBox(width: 5,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                  //width: width/3,
                                  decoration: BoxDecoration(
                                    color: b01,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                  ),child: Center(child: Text("معرفی",style: TextStyle(color: b03,fontFamily: dana,fontSize: 12),)),),
                              ],
                            ),
                          ),

                        ],)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        GestureDetector(
            onTap: (){},

            child:Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: cMain,width: 1),
              ),
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: Text("همه مجموعه ها",style: TextStyle(color: cMain,fontFamily: dana,fontSize: 14),) ,)
        ),
      ],
    );
  }
}
