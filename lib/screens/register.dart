import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/bloc/change_state.dart';
import 'package:gymjibi/bloc/view_model_change.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/helper/custom_button.dart';
import 'package:gymjibi/screens/home/home_screen.dart';
import 'package:gymjibi/screens/login.dart';
import 'package:gymjibi/screens/textFiled.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/sign_in_api/logic/state/auth_login_state.dart';
import '../data/sign_in_api/logic/view_model/auth_login_view_model.dart';

class Register {
  static final TextEditingController controllerPhone = TextEditingController();
  static final TextEditingController controllerConfirmCode =
      TextEditingController();
  static final TextEditingController controllerCreatePass =
      TextEditingController();

  static void bottomSheetEnterNumber(context) {
    final signInViewModel=LoginViewModel();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: 24,
                left: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 12),
                  height: 4.h,
                  width: 58.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r), color: b01),
                ),
                Text(
                  "ورود یا ثبت نام",
                  style: h3,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "لطفا شماره موبایل خود را وارد کنید",
                  style: h5,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldWidget(
                  textInputType: TextInputType.phone,
                  digitsOnly: true,
                  lengthLimitInput: 11,
                  controller: controllerPhone,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 6),
                    child: Wrap(
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          color: ccb,
                          width: 1,
                          height: 32,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("98+", style: bodyXL.copyWith(color: ccb)),
                        // SvgPicture.asset("assets/icons/98.svg", color: ccb),
                      ],
                    ),
                  ),
                  labelText: "شماره موبایل",
                  textAlign: TextAlign.left,
                  inputTextDirection: TextDirection.ltr,
                ),
                const SizedBox(
                  height: 24,
                ),
                BlocConsumer(
                  bloc:signInViewModel,
                  builder: (context, state) {
                    return   MyCustomButton(
                      height: 58.h,
                      title: "تایید",
                      loading: state is LoginLoadingState,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: 8,
                      onTap: () {
                        Navigator.pop(context);
                        bottomSheetConfirmCode(context);
                      },
                    );
                  },
                  listener: (context, state) {
                    if(state is LoginSuccessState){
                      Navigator.pop(context);
                      bottomSheetConfirmCode(context);
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Login.bottomSheetLogin(context);
                    },
                    child: Text(
                      "ورود با کلمه عبور",
                      style: buttonSM,
                    )),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void bottomSheetConfirmCode(context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: 24,
                left: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 12),
                  height: 4.h,
                  width: 58.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r), color: b01),
                ),
                Text(
                  "کد تایید را وارد کنید",
                  style: h3,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "کد ارسال شده به شماره ${controllerPhone.text} را وارد کنید.",
                  style: h5,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      bottomSheetEnterNumber(context);
                    },
                    child: Text(
                      "اصلاح شماره موبایل",
                      style: buttonSM,
                    )),
                const SizedBox(
                  height: 24,
                ),
                TextFieldWidget(
                  controller: controllerConfirmCode,
                  digitsOnly: true,
                  lengthLimitInput: 6,
                  textInputType: TextInputType.number,
                  inputTextDirection: TextDirection.ltr,
                  labelText: "کد ارسال شده",
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Get.to(()=>Rigester002());
                    Navigator.pop(context);
                    bottomSheetNameAndPass(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cMain,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    child: Center(
                      child: Text("تایید و ادامه", style: buttonLG),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Login.bottomSheetLogin(context);
                    },
                    child: Text(
                      "ورود با کلمه عبور",
                      style: buttonSM,
                    )),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void bottomSheetNameAndPass(context) {
    _launchURL() async {
      final Uri url = Uri.parse('https://gymjibi.com/terms');
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    final createPassword = ViewModelEditFiled();
    // final createReePassword = ViewModelEditFiled();

    final wantCollection = ViewModelEditFiled();

    bool btn1 = false;
    bool btn2 = true;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: 24,
                left: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 12),
                  height: 4.h,
                  width: 58.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r), color: b01),
                ),
                Text(
                  "ثبت نام",
                  style: h3,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "به جیم‌جیبی خوش اومدید!",
                  style: h5,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
/*                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder(
                        bloc: wantCollection,
                        builder: (context, state) {
                          if (state is EditFiledValueState) {
                            return GestureDetector(
                              onTap: () {
                                btn1 = true;
                                if (btn1 == true) {
                                  btn2 = false;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: btn1 == false
                                      ? Colors.transparent
                                      : b01.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                ),
                                height: 70,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      btn1 == false
                                          ? "assets/icons/home_d.svg"
                                          : "assets/icons/home_d.svg",
                                      color: btn1 == false ? c75 : cMain,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('مجموعه دار', style: bodyXL
                                        //btn1 == false ? Body_LGd:Body_LGs,
                                        ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        }),
                    BlocBuilder(
                        bloc: wantCollection,
                        builder: (context, state) {
                          if (state is EditFiledValueState) {
                            return GestureDetector(
                              onTap: () {
                                btn2 = true;
                                if (btn2 == true) {
                                  btn1 = false;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: btn2 == false
                                      ? Colors.transparent
                                      : b01.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                ),
                                height: 70,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      btn2 == false
                                          ? "assets/icons/calendar_d.svg"
                                          : "assets/icons/calendar_d.svg",
                                      color: btn2 == false ? c75 : cMain,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'مجموعه خواه',
                                      style: btn2 == false ? bodyLGd : bodyLGs,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        }),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),*/
            // نوع ٍثبت نام (کاربر معمولی و مجموعه دار)
                BlocBuilder(
                    bloc: createPassword,
                    builder: (context, state) {
                      if (state is EditFiledValueState) {
                        return TextFieldWidget(
                          controller: controllerCreatePass,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                createPassword.editFiled(!state.value);
                              },
                              child: Icon(
                                state.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: c75,
                              )),
                          labelText: "کلمه عبور",
                          obscureText: state.value,
                          textAlign: TextAlign.left,
                          inputTextDirection: TextDirection.ltr,
                          noSpaces: true,
                        );
                      }
                      return const SizedBox();
                    }),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/info_circle.svg",
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "استفاده از جیم‌جیبی به معنی پذیرش ",
                            style: bodyXSbl,
                            textAlign: TextAlign.justify,
                          ),
                          GestureDetector(
                              onTap: () {
                                _launchURL;
                                // launchUrl(Uri.parse('https://gymjibi.com/terms'));
                              },
                              child: Text(
                                " قوانین و مقررات ",
                                style: bodyXSb,
                                textAlign: TextAlign.justify,
                              )),
                          Text(
                            "این سرویس است.",
                            style: bodyXSbl,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.offAll(() => const Homescreen());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cMain,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    child: Center(
                      child: Text("ثبت نام در جیم‌جیبی", style: buttonLG),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
