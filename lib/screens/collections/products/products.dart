import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/data/single_gym/bloc/view_model/single_gym.dart';
import 'package:gymjibi/screens/collections/collections.dart';
import 'package:gymjibi/screens/collections/products/components/picture.dart';
import 'package:gymjibi/screens/collections/products/components/tabs/comments.dart';
import 'package:gymjibi/screens/collections/products/components/tabs/features.dart';
import 'package:gymjibi/screens/collections/products/components/tabs/sans.dart';
import 'package:gymjibi/screens/home/home_screen.dart';
import 'package:gymjibi/open_street_map.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../data/single_gym/bloc/state/single_gym_state.dart';
import 'components/details.dart';
import 'components/tabs/continue_reservation.dart';

class Products extends StatefulWidget {
  final num index02;
  final String id;

  const Products({super.key, required this.index02, required this.id});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ScrollPhysics physics = const AlwaysScrollableScrollPhysics();
  final GlobalKey _containerKey = GlobalKey();

  final GetEventViewModel singleGymViewModel = GetEventViewModel();

  num? discountPercent;

  @override
  void initState() {
    physics = const AlwaysScrollableScrollPhysics();

    // TODO: implement initState
    super.initState();
    singleGymViewModel.getEvent(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: singleGymViewModel,
        builder: (context, state) {
          if (state is SingleGymLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is SingleGymSuccessState) {
            var parts = state.response.gym.coordinates.split(',');
            price() {
              if (state.response.gym.discountPrice == 0) {
                debugPrint('قیمت عادی: ${state.response.gym.priceStart}');
                return Text(
                  state.response.gym.priceStart.toString().seRagham(),
                  style: bodyLG.copyWith(
                      fontSize: 19.sp, fontWeight: FontWeight.w700),
                );
              } else {
                discountPercent = (((int.parse(state.response.gym.priceStart) -
                                state.response.gym.discountPrice) /
                            int.parse(state.response.gym.priceStart)) *
                        100)
                    .toInt();
                debugPrint('درصد تخفیف: $discountPercent%');

                debugPrint(
                    'قیمت تخفیف خورده: ${state.response.gym.discountPrice}');
                return Text(
                  state.response.gym.discountPrice.toString().seRagham(),
                  style: bodyLG.copyWith(
                      fontSize: 19.sp, fontWeight: FontWeight.w700),
                );
              }
            }

            return Scaffold(
              extendBody: true,
              backgroundColor: cf9,
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      if (widget.index02 == 0) {
                        Get.offAll(() => const Homescreen());
                      }
                      if (widget.index02 == 2) {
                        Get.offAll(() => const Collections());
                      }
                      if (widget.index02 == 4) {
                        Get.back();
                      }
                    },
                    child: SvgPicture.asset("assets/icons/exit.svg"),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icons/share.svg",
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/icons/more.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                physics: physics,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Listener(
                        onPointerMove: (details) {
                          if (physics == const NeverScrollableScrollPhysics()) {
                            setState(() {
                              physics = const AlwaysScrollableScrollPhysics();
                              if (kDebugMode) {
                                print(physics);
                              }
                            });
                          }
                        },
                        child: Container(
                            color: Colors.transparent,
                            child: Picture(
                              image: state.response.gym.gallery,
                            ))),
                    Listener(
                        onPointerMove: (details) {
                          if (physics == const NeverScrollableScrollPhysics()) {
                            setState(() {
                              physics = const AlwaysScrollableScrollPhysics();
                              if (kDebugMode) {
                                print(physics);
                              }
                            });
                          }
                        },
                        child: Container(
                            color: Colors.transparent,
                            child: Details(
                              enabled: state.response.gym.enabled,
                              category: state.response.gym.category,
                              description: state.response.gym.description,
                              name: state.response.gym.name,
                              rate: state.response.gym.rate,

                              priceStart:
                                  int.parse(state.response.gym.priceStart),
                              discountPrice: state.response.gym.discountPrice,
                              // discountPrice: int.parse(state.response.gym.discountPrice.toString().contains(RegExp(r'[0-9]'))?state.response.gym.discountPrice.toString():"0"),

                              city: state.response.gym.city,
                              timeSans: state.response.gym.sansDuration,
                              reservedCount: state.response.gym.reservedCount,
                              gender: state.response.gym.acceptedGender,
                              maxBookPersonCount:
                                  state.response.gym.maxBookPersonCount,
                              minBookPersonCount:
                                  state.response.gym.minBookPersonCount,
                              address: state.response.gym.address,
                            ))),
                    Listener(
                        onPointerMove: (details) {
                          if (physics == const NeverScrollableScrollPhysics()) {
                            setState(() {
                              physics = const AlwaysScrollableScrollPhysics();
                              if (kDebugMode) {
                                print(physics);
                              }
                            });
                          }
                        },
                        child: Container(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Features(
                                  features: state.response.gym.features,
                                ),
                                const SizedBox(
                                  height: 45,
                                )
                              ],
                            ))),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 58.h, horizontal: 20),
                      child: GestureDetector(
                        onTap: () {
                          //محمد
                          // Get.to(() => const ShowCollectionMap());
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image(
                                fit: BoxFit.cover,
                                height: 110,
                                image: AssetImage(
                                  "assets/images/home/btn_map.png",
                                ),
                              ),
                            ),
                            Text(
                              "نمایش مجموعه روی نقشه",
                              style: h4.copyWith(),
                            )
                          ],
                        ),
                      ),
                    ),
                    //محمد
                    // GestureDetector(
                    //   onTap: () {
                    //     if (physics == const AlwaysScrollableScrollPhysics()) {
                    //       setState(() {
                    //         physics = const NeverScrollableScrollPhysics();
                    //         if (kDebugMode) {
                    //           print(physics);
                    //         }
                    //       });
                    //     }
                    //   },
                    //   child: Stack(
                    //     alignment: Alignment.bottomCenter,
                    //     children: [
                    //       //محمد
                    //       // OpenStreetMap(
                    //       //   collectionsLatitude: double.parse(parts[0]),
                    //       //   collectionsLongitude: double.parse(parts[1]),
                    //       //   address: state.response.gym.address,
                    //       //   nameGym: state.response.gym.name,
                    //       // ),
                    //       if (physics != const NeverScrollableScrollPhysics())
                    //         Container(
                    //           margin: const EdgeInsets.symmetric(
                    //               vertical: 15, horizontal: 35),
                    //           decoration: BoxDecoration(
                    //               color: Colors.grey.withOpacity(.6),
                    //               borderRadius: BorderRadius.circular(16)),
                    //           width: double.infinity,
                    //           height: 220,
                    //           child: Center(
                    //               child: Text(
                    //             "برای استفاده لمس کنید!",
                    //             style: h5,
                    //           )),
                    //         )
                    //     ],
                    //   ),
                    // ),

                    //جدول بندی رزرو
                    state.response.gym.enabled
                        ? Listener(
                            onPointerMove: (details) {
                              if (physics ==
                                  const NeverScrollableScrollPhysics()) {
                                setState(() {
                                  {
                                    physics =
                                        const AlwaysScrollableScrollPhysics();
                                    if (kDebugMode) {
                                      print(physics);
                                    }
                                  }
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 45,
                                  ),
                                  SizedBox(
                                      key: _containerKey,
                                      child: Sans(
                                        category: state.response.gym.category,
                                        poolDetails: state
                                            .response.gym.poolDetails!.tableImg,
                                        disCount:
                                            state.response.gym.discountPrice,
                                        lsFeature:
                                            state.response.additionalProducts,
                                        nameGym: state.response.gym.name,
                                        totalPrice:
                                            state.response.gym.priceStart,
                                        priceTable:
                                            state.response.gym.priceTable,
                                        id:state.response.gym.id, booked: state.response.bookeds,
                                      )),
                                ],
                              ),
                            ))
                        : const SizedBox(),

                    Listener(
                      onPointerMove: (details) {
                        if (physics == const NeverScrollableScrollPhysics()) {
                          setState(() {
                            {
                              physics = const AlwaysScrollableScrollPhysics();
                              if (kDebugMode) {
                                print(physics);
                              }
                            }
                          });
                        }
                      },
                      child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "نظرات",
                                  style: h4,
                                ),
                                state.response.comments.isEmpty ||
                                        state.response.comments == []
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                            "نظری برای این مجموعه ثبت نشده!",
                                            style: bodyXL),
                                      )
                                    : ListView.builder(
                                        physics: const ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            state.response.comments.length,
                                        itemBuilder: (context, index) {
                                          var comments =
                                              state.response.comments[index];
                                          var rate = (comments.rate.price +
                                              comments.rate.service +
                                              comments.rate.location +
                                              comments.rate.cleanliness);

                                          String dateTimeString =
                                              comments.postedAt;
                                          DateTime dateTime =
                                              DateTime.parse(dateTimeString);
                                          Jalali jalaliDate =
                                              Jalali.fromDateTime(dateTime);
                                          String jalaliDateString =
                                              '${jalaliDate.year}/${jalaliDate.month}/${jalaliDate.day}';

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 12.0),
                                            child: Comments(
                                              userprofile: comments.userprofile,
                                              rating: double.parse((rate / 4)
                                                  .toStringAsFixed(1)),
                                              username: comments.username,
                                              body: comments.body,
                                              postedAt: jalaliDateString,
                                            ),
                                          );
                                        }),
                                const SizedBox(height: 60),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 12)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: state.response.gym.enabled
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  crossAxisAlignment: state.response.gym.enabled
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.center,
                  children: [
                    state.response.gym.enabled
                        ? GestureDetector(
                            onTap: () {
                              state.response.gym.category != "pool"
                                  ? Scrollable.ensureVisible(
                                      _containerKey.currentContext!,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    )
                                  : Get.to(ContinueReservation.new);
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: cMain.withOpacity(0.5),
                                        spreadRadius: 1.5,
                                        blurRadius: 8)
                                  ],
                                  color: cMain,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icons/calendaradd.svg"),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'رزرو کنید',
                                      style: buttonSMw,
                                    ),
                                  ],
                                )),
                          )
                        : const SizedBox(),
                    state.response.gym.enabled
                        ? IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    state.response.gym.discountPrice != 0
                                        ? Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                state.response.gym.priceStart
                                                    .toString()
                                                    .seRagham(),
                                                style: h6.copyWith(color: ccb),
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
                                      width: 16.w,
                                    ),
                                    state.response.gym.discountPrice != 0
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 7.w, vertical: 5.h),
                                            decoration: BoxDecoration(
                                              color: redBack,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8)),
                                            ),
                                            child: Text(
                                              // "${discountPercent.toString()}"
                                              "${state.response.gym.discountPrice != 0 ? discountPercent = (((int.parse(state.response.gym.priceStart) - state.response.gym.discountPrice) / int.parse(state.response.gym.priceStart)) * 100).toInt() : state.response.gym.discountPrice = state.response.gym.discountPrice}"
                                              "%",
                                              style:
                                                  h5.copyWith(color: redText),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(children: [
                                  Text(
                                    'قیمت ',
                                    style: bodyLG.copyWith(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: price(),
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/toman.svg",
                                    height: 12,
                                    width: 16,
                                  ),
                                ]),
                              ],
                            ),
                          )
                        : Flexible(
                            child: Wrap(
                            children: [
                              Text(
                                "این مجموعه قابل رزرو نمی‌باشد!",
                                textAlign: TextAlign.center,
                                style: bodyLG.copyWith(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                  ],
                ),
              ),
            );
          }
          if (state is SingleGymFailedState) {
            debugPrint(
                "  در پردازش اطلاعات خطایی رخ داده است \n" "${state.message}");
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Text(
                  "  در پردازش اطلاعات خطایی رخ داده است \n" "${state.message}",
                  style: bodyMD,
                ),
              ),
            );
          }
          return const SizedBox();
        });
  }
}
