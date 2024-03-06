import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/screens/drawer/components/account/Dashbord06.dart';
import 'package:gymjibi/screens/register.dart';
import 'package:gymjibi/screens/textFiled.dart';
import 'package:get/get.dart';

import 'constants.dart';

class EditPhoneNumber {

  static TextEditingController newNumber = TextEditingController();
  static TextEditingController controllerConfirmCode = TextEditingController();
  static TextEditingController controllerNewConfirmCode = TextEditingController();

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
              "کد ارسال شده به شماره ${Register.controllerPhone.text} را وارد کنید.",
              style: h5,
              textAlign: TextAlign.center,
            ),
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
                Navigator.pop(context);
                bottomSheetEnterNewNumber(context);
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

  static void bottomSheetEnterNewNumber(context) {
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
              "ویرایش شماره موبایل",
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
              controller: newNumber,
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
                bottomSheetNewConfirmCode(context);
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
              height: 32,
            ),
          ],
        ),
          ),
        );
      },
    );
  }

  static void bottomSheetNewConfirmCode(context) {
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
              "کد ارسال شده به شماره ${newNumber.text} را وارد کنید.",
              style: h5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              controller: controllerNewConfirmCode,
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
                Navigator.pop(context);
                Get.offAll(() => Dashbord06());
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
