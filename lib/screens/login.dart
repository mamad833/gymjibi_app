import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/bloc/change_state.dart';
import 'package:gymjibi/bloc/view_model_change.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/screens/home/home_screen.dart';
import 'package:gymjibi/screens/register.dart';
import 'package:gymjibi/screens/textFiled.dart';

import 'package:get/get.dart';

import '../data/sign_in_api/logic/state/auth_login_state.dart';
import '../data/sign_in_api/logic/view_model/auth_login_view_model.dart';
import '../helper/custom_button.dart';

class Login {

  static TextEditingController controllerPhone = TextEditingController();
  static final TextEditingController controllerPass = TextEditingController();

  static TextEditingController controllerPhoneNewPass = TextEditingController();
  static final TextEditingController controllerConfirmCodeNewPass = TextEditingController();
  static final TextEditingController controllerEnterNewPass = TextEditingController();
  static final TextEditingController controllerEnterNewReePass = TextEditingController();

  static late TextEditingController controllerPhoneOneTime = TextEditingController();
  static final TextEditingController controllerConfirmCodeOneTime = TextEditingController();


  static void bottomSheetLogin(context) {

    controllerPhone=Register.controllerPhone;

    final password = ViewModelEditFiled();
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16,bottom: 12),
              height: 4.h,
              width: 58.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: b01
              ),
            ),
            Text(
              "ورود",
              style: h3,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "شماره موبایل خود را به همراه رمز عبور وارد کنید",
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
              suffixIcon: Padding(padding: EdgeInsets.only(left: 10,right: 6),child: Wrap(
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
              ),),
              labelText: "شماره موبایل",
              textAlign: TextAlign.left,
              inputTextDirection: TextDirection.ltr,
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder(
                bloc: password,
                builder: (context,state){
                  if(state is EditFiledValueState){
                    return
                      TextFieldWidget(
                      controller: controllerPass,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            password.editFiled(!state.value);
                          },
                          child: Icon(state.value ? Icons.visibility : Icons.visibility_off,color: c75,)),
                        labelText: "رمز عبور",
                      obscureText: state.value,
                        // textAlign: TextAlign.left,
                        inputTextDirection: TextDirection.ltr,
                        noSpaces: true,
                    );
                  }
                  return const SizedBox();

                }),
            const SizedBox(
              height: 24,
            ),
            BlocConsumer(
              bloc: signInViewModel,
              builder: (context, state) {
                return MyCustomButton(
                  title: "تایید",
                  loading: state is LoginLoadingState,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  borderRadius: 8,
                  onTap: () {
                    signInViewModel.login(
                        phone: controllerPhone.text, pass: controllerPass.text);
                  },
                );
              },
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  Get.offAll(const Homescreen());
                }
              },
            ),

            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      // // Get.to(()=>passphonenumber());
                      // Navigator.pop(context);
                      // bottomSheetEnterNumberNewPass(context);
                    },
                    child: Text(
                      "فراموشی کلمه عبور",
                      style: buttonSM,
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Register.bottomSheetEnterNumber(context);
                    },
                    child: Text(
                      "ثبت نام",
                      style: buttonSM,
                    )),
                /*GestureDetector(
                      onTap: () {},
                      child: Text(
                        "ورود با رمز یکبار مصرف",
                        style: Button_SM,
                      )),*/
              ],
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

  ///Create a new password
  static void bottomSheetEnterNumberNewPass(context) {
    controllerPhoneNewPass = Register.controllerPhone;
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
              margin: const EdgeInsets.only(top: 16,bottom: 12),
              height: 4.h,
              width: 58.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: b01
              ),
            ),
            Text(
              "بازیابی کلمه‌عبور",
              style: h3,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "شماره موبایل خود را وارد کنید",
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
              controller: controllerPhoneNewPass,
              suffixIcon: Padding(padding: EdgeInsets.only(left: 10,right: 6),child: Wrap(
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
              ),),
              labelText: "شماره موبایل",
              textAlign: TextAlign.left,
              inputTextDirection: TextDirection.ltr,
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                // Get.to(()=>passcode());
                Navigator.pop(context);
                bottomSheetConfirmCodeNewPass(context);
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
              height: 24,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  bottomSheetEnterNumber(context);
                },
                child: Text(
                  "ورود با رمز یکبار مصرف",
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

  static void bottomSheetConfirmCodeNewPass(context) {
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
              margin: const EdgeInsets.only(top: 16,bottom: 12),
              height: 4.h,
              width: 58.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: b01
              ),
            ),
            Text(
              "بازیابی کلمه‌عبور",
              style: h3,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "کد ارسال شده را وارد کنید",
              style: h5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              controller: controllerConfirmCodeNewPass,
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
                // Get.to(()=>passnew());
                Navigator.pop(context);
                bottomSheetEnterNewPass(context);
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
              height: 32,
            ),
          ],
        ),
          ),
        );
      },
    );
  }

  static void bottomSheetEnterNewPass(context) {

    final newPassword = ViewModelEditFiled();
    final newReePassword = ViewModelEditFiled();

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
              margin: const EdgeInsets.only(top: 16,bottom: 12),
              height: 4.h,
              width: 58.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: b01
              ),
            ),
            Text(
              "بازیابی کلمه‌عبور",
              style: h3,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "کلمه‌عبور جدید رو وارد کنید",
              style: h5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder(
                bloc: newPassword,
                builder: (context,state){
                  if(state is EditFiledValueState){
                    return
                      TextFieldWidget(
                        controller: controllerEnterNewPass,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              newPassword.editFiled(!state.value);
                            },
                            child: Icon(state.value ? Icons.visibility : Icons.visibility_off,color: c75,)),
                        labelText: "کلمه عبور جدید",
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
            BlocBuilder(
                bloc: newReePassword,
                builder: (context,state){
                  if(state is EditFiledValueState){
                    return
                      TextFieldWidget(
                        controller: controllerEnterNewReePass,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              newReePassword.editFiled(!state.value);
                            },
                            child: Icon(state.value ? Icons.visibility : Icons.visibility_off,color: c75,)),
                        labelText: "تکرار کلمه عبور جدید",
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
            ElevatedButton(
              onPressed: () {
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
                  child: Text("تایید و تغیر کلمه‌عبور", style: buttonLG),
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

  ///Login with a one-time password

  static void bottomSheetEnterNumber(context) {

    controllerPhoneOneTime = Register.controllerPhone;

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
              margin: const EdgeInsets.only(top: 16,bottom: 12),
              height: 4.h,
              width: 58.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: b01
              ),
            ),
            Text(
              "ورود با رمز یکبار مصرف",
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
              controller: controllerPhoneOneTime,
              suffixIcon: Padding(padding: EdgeInsets.only(left: 10,right: 6),child: Wrap(
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
              ),),
              labelText: "شماره موبایل",
              textAlign: TextAlign.left,
              inputTextDirection: TextDirection.ltr,
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                bottomSheetConfirmCode(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: cMain,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                child: Center(
                  child: Text("تایید و دریافت کد", style: buttonLG),
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
              margin: const EdgeInsets.only(top: 16,bottom: 12),
              height: 4.h,
              width: 58.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: b01
              ),
            ),
            Text(
              "کد تایید را وارد کنید",
              style: h3,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "کد ارسال شده به شماره ${controllerPhoneOneTime.text} را وارد کنید.",
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
              controller: controllerConfirmCodeOneTime,
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
                  child: Text("تایید", style: buttonLG),
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
}
