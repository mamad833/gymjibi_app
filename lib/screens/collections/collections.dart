import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/navigation.dart';
import 'package:get/get.dart';
import 'package:gymjibi/screens/collections/products/products.dart';
import 'package:gymjibi/screens/home/home_screen.dart';
import 'package:gymjibi/search/search_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/data/get_all_gym/bloc/state/get_all_gym_state.dart';
import 'package:gymjibi/ratingbar.dart';
import 'package:gymjibi/screens/collections/collections.dart';
import 'package:gymjibi/screens/collections/products/products.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../data/get_all_gym/bloc/view_model/get_all_gym.dart';
import '../home/components/special_offers.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Collections extends StatefulWidget {
  const Collections({Key? key}) : super(key: key);

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  bool? enabled;
  String? id;
  bool? active;
  String? rate;
  String? nameGym;
  String? city;
  String? address;
  num? priceStart;
  num? discountPrice;
  List<String>? pic;

  final GetGymViewModel getGymViewModel = GetGymViewModel();

  num? discountPercent;

  void initState() {
    print("hir");
    getGymViewModel.getTopGym();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    price() {
      if (discountPrice == 0) {
        print('قیمت عادی: ${priceStart}');
        return Text(
          priceStart.toString().seRagham(),
          style: h6.copyWith(color: gTxt),
        );
      } else {
        /*discountPercent = ((( priceStart - discountPrice ) / priceStart) * 100).toInt();
      print('درصد تخفیف: $discountPercent%');*/

        print('قیمت تخفیف خورده: ${discountPrice}');
        return Text(
          discountPrice.toString().seRagham(),
          style: h6.copyWith(color: gTxt),
        );
      }
    }

    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        // برگرداندن به صفحه خانه
        Get.offAll(
          Homescreen.new, /*transition: Transition.noTransition*/
        );
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
              padding: EdgeInsets.only(top: 20, right: 4, left: 4),
              child: SearchForm(),
            ),
          ),
        ),
        backgroundColor: cf9,
        extendBody: true,
        body: Container(
            margin: const EdgeInsets.only(bottom: 30, top: 5),
            child: BlocBuilder(
                bloc: getGymViewModel,
                builder: (context, state) {
                  if (state is GetAllLoadingState) {
                    print("2");
                    // return Container();
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is GetAllSuccessState) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: state.response.length,
                      itemBuilder: (BuildContext context, int index) {
                        enabled = state.response[index].enabled;
                        active = active;
                        id = state.response[index].id;
                        rate = state.response[index].rate;
                        nameGym = state.response[index].name;
                        city = state.response[index].city;
                        address = state.response[index].address;
                        priceStart =
                            int.parse(state.response[index].priceStart);
                        discountPrice = int.parse(state
                                .response[index].discountPrice
                                .contains(RegExp(r'[0-9]'))
                            ? state.response[index].discountPrice
                            : "0");
                        // discountPrice = int.parse(state.response[index].discountPrice);
                        pic = state.response[index].gallery;

                        String encodedUrl = Uri.encodeFull(pic!.first);
                        encodedUrl = encodedUrl.replaceFirst("http://", "https://");

                        return GestureDetector(
                          onTap: () {
                            Get.to(() => Products(
                                  index02: 2,
                                  id: state.response[index].id,
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffCFDAED)
                                        .withOpacity(0.5),
                                    spreadRadius: 1.5,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                                color: white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              width: width - 65,
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child:
                                        Image.network(
                                          encodedUrl,
                                          height: MediaQuery.of(context).size.width / 2 - 45,
                                          width: MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            debugPrint(" error: $error");
                                            return Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context).size.width / 2 - 45,
                                              child: Text(
                                                " خطایی در نمایش تصویر رخ داده است",
                                                style: bodyXL,
                                              ),
                                            );
                                          },
                                        )

                                        /*Image(
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                45,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            image: NetworkImage(pic!.first),
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              debugPrint("pic: ${pic!.first}");
                                              String encodedUrl =
                                                  Uri.encodeFull(state
                                                      .response[index]
                                                      .gallery
                                                      .first);
                                              encodedUrl =
                                                  encodedUrl.replaceFirst(
                                                      "http://", "https://");
                                              return Image.network(
                                                  fit: BoxFit.cover,
                                                  height: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      45,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  encodedUrl);
                                            }),*/

                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              nameGym!,
                                              style: h4,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            rate!,
                                            style: bodyMD,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 4, right: 0),
                                            alignment: Alignment.center,
                                            // color: Colors.red,
                                            child: Icon(
                                              Icons.star_rounded,
                                              color: yellow,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      RichText(
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: IntrinsicWidth(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 4),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 3, horizontal: 6),
                                                alignment: Alignment.center,
                                                // width: 74.w,
                                                // height: 33.h,
                                                decoration: BoxDecoration(
                                                    color: b01,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/location.svg",
                                                      color: secondary,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      city!,
                                                      style: bodyXLs.copyWith(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                              text: address, style: bodyMD),
                                        ]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  enabled == true
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            discountPrice != 0
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7.w,
                                                            vertical: 5.h),
                                                    decoration: BoxDecoration(
                                                      color: redBack,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  8)),
                                                    ),
                                                    child: Text(
                                                      // "${discountPercent.toString()}" "%",
                                                      "${discountPrice != 0 ? discountPercent = (((priceStart! - discountPrice!) / priceStart!) * 100).toInt() : discountPrice = discountPrice}"
                                                      "%",
                                                      style: h5.copyWith(
                                                          color: redText),
                                                    ),
                                                  )
                                                : SizedBox(),
                                            Spacer(),
                                            discountPrice != 0
                                                ? Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Text(
                                                        priceStart
                                                            .toString()
                                                            .seRagham(),
                                                        style: h6.copyWith(
                                                            color: ccb),
                                                      ),
                                                      Transform.rotate(
                                                        angle: -0.15,
                                                        child: Container(
                                                          width: 56,
                                                          height: 1,
                                                          color: c75,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 7.w,
                                                  vertical: 5.h),
                                              decoration: BoxDecoration(
                                                color: gBack,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/icons/dollar-circle.svg"),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  price(),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  SvgPicture.asset(
                                                    "assets/icons/toman.svg",
                                                    height: 12,
                                                    width: 16,
                                                    color: gTxt,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : Center(
                                          child: Text(
                                          "این مجموعه قابل رزرو نمی‌باشد!",
                                          textAlign: TextAlign.center,
                                          style: bodyLG.copyWith(
                                              color: Colors.red,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600),
                                        )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox();
                })),
        bottomNavigationBar: BottomNavBar(index: 2),
      ),
    );
  }
}
