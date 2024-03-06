import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/screens/collections/products/products.dart';
import 'package:gymjibi/screens/textFiled.dart';
import 'package:get/get.dart';

class Item_Reserv extends StatefulWidget {
  const Item_Reserv({Key? key}) : super(key: key);

  @override
  State<Item_Reserv> createState() => _Item_ReservState();
}

class _Item_ReservState extends State<Item_Reserv> {
  bool _isPlay = false;
  late AnimationController _controller;

  bool _buttonState = false;

  int isIndex = 0;

  bool btn1 = false;
  bool btn2 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: white
      ),
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 75,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16),),
                          image: DecorationImage(
                            image: AssetImage("assets/images/home/test/paint.png",),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: cf9,
                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 8,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(-2, 2)
                          )]
                        ),
                        width: 90,
                        child: Center(child: Text("تایید شده",style: bodyXSb,)),
                      )
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("پینت بال پرواز",style: h5,),

                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/clock.svg", ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("برای 7 مهر 1401",style: bodyXS,),
                              Text("ساعت 10:30 - 13:00",style: bodyXS,),
                            ],),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(width: MediaQuery.of(context).size.width,height: 0.5,color: ccb,),
              SizedBox(height: 12,)
            ],
          ),
          AnimatedContainer(
              color: white,
              duration: Duration(milliseconds: _buttonState ? 300 : 200),
              child:_buttonState ?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/info-circle.svg", ),
                            SizedBox(width: 10,),
                            Text('اطلاعات رزرو',style: bodyXL,),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text('تعداد'' 10 ''نفر',style: bodyXS,),
                        Text('4 بسته 50 تایی',style: bodyXS,),
                        Text('رزرو در تاریخ 15 شهریور 1401 ساعت 20:30 به ثبت رسیده',style: bodyXS,),
                      ],),
                  ),
                  Container(width: MediaQuery.of(context).size.width,height: 0.5,color: ccb,margin: EdgeInsets.all(12),),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/wallet-2.svg", ),
                            SizedBox(width: 10,),
                            Text('هزینه',style: bodyXL,),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text('280 هزار تومان',style: bodyXS,),
                        Text('پرداخت در تاریخ 15 شهریور 1401 ساعت 20:30',style: bodyXS,),
                      ],),
                  ),
                  Container(width: MediaQuery.of(context).size.width,height: 0.5,color: ccb,margin: EdgeInsets.all(12),),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0,bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/information.svg", ),
                            SizedBox(width: 10,),
                            Text('اطلاعات مجموعه',style: bodyXL,),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/location.svg", ),
                            SizedBox(width: 5,),
                            Text('تهران، سعادت آباد، بلوار گلدیسان، مجموعه پرواز',style: bodyXS,),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){Get.to(()=>Products(index02: 4,id: "1111"/*این ایدی بیاد تغییر کند از سمت سرور باشد*/,));},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1,color: c75,)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                            margin: EdgeInsets.only(top: 7),
                            child: Text('نمایش مجموعه',style: buttonLG75,),
                          ),
                        )
                      ],),
                  ),
                ],
              ):null
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: MediaQuery.of(context).size.width,height: 0.5,color: ccb,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _buttonState = !_buttonState;
                        });
                      },
                      child: Text(
                        _buttonState ?
                        "کمتر":"بیشتر",
                        style: bodyXL,
                      )),
                  IconButton(
                    icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        transitionBuilder: (child, anim) =>
                            RotationTransition(
                              turns: child.key == ValueKey('icon1')
                                  ? Tween<double>(begin: 0.5, end: 1).animate(anim)
                                  : Tween<double>(begin: 1, end: 0.5).animate(anim),
                              child: ScaleTransition(scale: anim, child: child),
                            ),
                        child: _buttonState
                            ? Icon(Icons.keyboard_arrow_up,
                            color: Colors.black, key: const ValueKey('icon1'))
                            : Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.black,
                          key: const ValueKey('icon2'),
                        )),
                    onPressed: () {
                      setState(() {
                        _buttonState = !_buttonState;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
