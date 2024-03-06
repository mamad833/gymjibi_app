import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/screens/collections/collections.dart';
import 'package:gymjibi/screens/collections/products/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymjibi/data/get_all_gym/bloc/state/get_all_gym_state.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/get_all_gym/bloc/view_model/get_all_gym.dart';

class FastBooking extends StatefulWidget {
  const FastBooking({super.key});

  @override
  _FastBookingState createState() => _FastBookingState();
}

class _FastBookingState extends State<FastBooking> {
  final PageController ctrl = PageController(
    initialPage: 0,
    viewportFraction: 0.80,
  );
  final GetGymViewModel getGymViewModel = GetGymViewModel();
  int currentPage = 0;
  String? reserveMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "رزرو سریع",
                style: h4,
              ),
              GestureDetector(
                  onTap: () {
                    Get.off(() => const Collections());
                  },
                  child: Row(
                    children: [
                      Text(
                        "همه",
                        style: buttonSM,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: cMain,
                      ),
                    ],
                  )),
            ],
          ),
        ),
        BlocBuilder(
            bloc: getGymViewModel,
            builder: (context, state) {
              if (state is GetAllLoadingState) {
                return Skeletonizer(
                  ignorePointers: true,
                  ignoreContainers: false,
                  enabled: true,
                  child: SizedBox(
                    height: 470.h,
                    child: PageView.builder(
                        controller: ctrl,
                        itemCount: 3,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          // Active page
                          bool active = index == currentPage;
                          final double top = active ? 0 : 10.h;
                          final double bottom = active ? 10.h : 0;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOutQuint,
                            margin: EdgeInsets.only(
                              top: top,
                              bottom: bottom,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 12.w),
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
                                        BorderRadius.all(Radius.circular(20.r)),
                                  ),
                                  width: 900.w,
                                  padding: EdgeInsets.all(15.r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            child: Image(
                                              height: 160,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/images/home/logo.png"),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "The name Collection",
                                                style: h4,
                                              ),
                                              Text(
                                                "rate",
                                                style: h6.copyWith(color: c75),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            'این یک متن طولانی است که بیش از سه خط می‌باشد و می‌خواهیم هنگام نمایش آن، سه نقطه اضافی نمایش داده شود.',
                                            style: bodyMD,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              width: 90,
                                              height: 30,
                                              color: gBack,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                );
              }
              if (state is GetAllSuccessState) {
                return SizedBox(
                  height: 470.h,
                  child: PageView.builder(
                      controller: ctrl,
                      itemCount: state.response.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        // Active page
                        bool active = index == currentPage;
                        return _buildStoryPage(
                          active: active,
                          // enabled: state.response[index].enabled,
                          id: state.response[index].id,
                          reserveMethod: state.response[index].reserveMethod,
                          rate: state.response[index].rate,
                          nameGym: state.response[index].name,
                          address: state.response[index].address,

                          priceStart:
                              int.parse(state.response[index].priceStart),
                          discountPrice: int.parse(state
                                  .response[index].discountPrice
                                  .contains(RegExp(r'[0-9]'))
                              ? state.response[index].discountPrice
                              : "0"),

                          off: 1,
                          city: state.response[index].city,
                          pic: state.response[index].gallery,
                          enabled: state.response[index].enabled,
                        );
                      }),
                );
              }
              return const SizedBox();
            })
      ],
    );
  }

  @override
  void initState() {
    print("hir");
    getGymViewModel.getTopGym();
    super.initState();
    ctrl.addListener(() {
      int pos = ctrl.page!.round();
      if (currentPage != pos) {
        {
          setState(() {
            currentPage = pos;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }
}

_buildStoryPage({
  required bool active,
  required enabled,
  required String id,
  required String reserveMethod,
  required String nameGym,
  required String address,
  required off,
  required num priceStart,
  required num? discountPrice,
  required String rate,
  required String city,
  required List<String> pic,
}) {
  num? discountPercent;
  discountPrice != 0
      ? discountPercent =
          (((priceStart - discountPrice!) / priceStart) * 100).toInt()
      : discountPrice = discountPrice;
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

  String encodedUrl = Uri.encodeFull(pic!.first);
  encodedUrl = encodedUrl.replaceFirst("http://", "https://");

  final double top = active ? 0 : 10.h;
  final double bottom = active ? 10.h : 0;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOutQuint,
    margin: EdgeInsets.only(
      top: top,
      bottom: bottom,
    ),
    child: GestureDetector(
      onTap: () {
        Get.to(() => Products(
              index02: 0,
              id: id,
            ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xffCFDAED).withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: 10,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          width: 900.w,
          padding: EdgeInsets.all(15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          encodedUrl,
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint(" error: $error");
                            return Container(
                              alignment: Alignment.center,
                              height: 160,
                              child: Text(
                                " خطایی در نمایش تصویر رخ داده است",
                                style: bodyXL,
                              ),
                            );
                          },
                        )
                      ),
                      reserveMethod == "fast"
                          ? IntrinsicWidth(
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: orangeBack,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "رزور سریع",
                                      style: bodyXS.copyWith(color: orangeText),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    SvgPicture.asset(
                                        "assets/icons/flash-circle.svg"),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          nameGym,
                          style: h4,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        rate,
                        style: bodyMD,
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 4, right: 0),
                        alignment: Alignment.center,
                        // color: Colors.red,
                        child: Icon(
                          Icons.star_rounded,
                          color: yellow,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: <Widget>[
                      IntrinsicWidth(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                          alignment: Alignment.center,
                          // width: 74.w,
                          // height: 33.h,
                          decoration: BoxDecoration(
                              color: b01,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/location.svg",
                                color: secondary,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                city,
                                style: bodyXLs.copyWith(
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          address,
                          style: bodyMD,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              enabled == true
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        discountPrice != 0
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.w, vertical: 5.h),
                                decoration: BoxDecoration(
                                  color: redBack,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                child: Text(
                                  "${discountPercent.toString()}" "%",
                                  style: h5.copyWith(color: redText),
                                ),
                              )
                            : SizedBox(),
                        Spacer(),
                        discountPrice != 0
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    priceStart.toString().seRagham(),
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
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color: gBack,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/dollar-circle.svg"),
                              SizedBox(
                                width: 4,
                              ),
                              price(),
                              /*Text(
                          discountPrice=="0"?price:discountPrice,
                          style: h6.copyWith(color: gTxt),
                        ),*/
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
    ),
  );
}
