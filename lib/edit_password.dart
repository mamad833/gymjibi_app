import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gymjibi/bloc/change_state.dart';
import 'package:gymjibi/screens/drawer/components/account/Dashbord06.dart';
import 'package:gymjibi/screens/textFiled.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/view_model_change.dart';
import 'constants.dart';
import 'screens/register.dart';

class EditPassword {

  static TextEditingController controllerEditPhone = TextEditingController();
  static TextEditingController controllerConfirmCode = TextEditingController();
  static TextEditingController controllerEditPass = TextEditingController();
  static TextEditingController controllerReePass = TextEditingController();

  static void bottomSheetPhoneNumber(context){
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
            padding: EdgeInsets.only(right: 24,left: 24,bottom: MediaQuery.of(context).viewInsets.bottom),
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
                const SizedBox(height: 24,),
                Text(
                  "کد ارسال شده به شماره ${Register.controllerPhone.text} را وارد کنید.",
                  style: h5,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldWidget(
                  controller: controllerEditPhone,
                  digitsOnly: true,
                  lengthLimitInput: 6,
                  textInputType: TextInputType.number,
                  inputTextDirection: TextDirection.ltr,
                  labelText: "کد ارسال شده",
                ),
                const SizedBox(height: 24,),
                ElevatedButton(
                  onPressed: () {
                    // Get.to(()=>passcode());
                    Navigator.pop(context);
                    bottomSheetEnterNewPass(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cMain,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child:  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                          "تایید و ادامه",
                          style: buttonLG
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32,),
              ],
            ),
          ),
        );
      },
    );
  }

  static void bottomSheetConfirmCodeNewPas(context){
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
            padding: EdgeInsets.only(right: 24,left: 24,bottom: MediaQuery.of(context).viewInsets.bottom),
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
                const SizedBox(height: 24,),
                Text(
                  "کد ارسال شده را وارد کنید",
                  style: h5,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24,),
                TextFieldWidget(
                  controller: controllerConfirmCode,
                  digitsOnly: true,
                  lengthLimitInput: 6,
                  textInputType: TextInputType.number,
                  inputTextDirection: TextDirection.ltr,
                  labelText: "کد ارسال شده",
                ),
                const SizedBox(height: 24,),
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
                  child:  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                          "تایید و ادامه",
                          style: buttonLG
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32,),
              ],
            ),
          ),
        );
      },
    );
  }

  static void bottomSheetEnterNewPass(context){
    final editPass = ViewModelEditFiled();
    final editReePass = ViewModelEditFiled();

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
            padding: EdgeInsets.only(right: 24,left: 24,bottom: MediaQuery.of(context).viewInsets.bottom),
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
                const SizedBox(height: 24,),
                Text(
                  "کلمه‌عبور جدید رو وارد کنید",
                  style: h5,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24,),
                BlocBuilder(
                    bloc: editPass,
                    builder: (context,state){
                  if(state is EditFiledValueState){
                    return TextFieldWidget(
                      controller: controllerEditPass,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            editPass.editFiled(!state.value);
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
                const SizedBox(height: 24,),
                BlocBuilder(
                    bloc: editReePass,
                    builder: (context,state){
                      if(state is EditFiledValueState){
                        return TextFieldWidget(
                          controller: controllerReePass,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                editReePass.editFiled(!state.value);
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
                const SizedBox(height: 24,),
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(()=>Dashbord06());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cMain,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child:  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                          "تایید و تغیر کلمه‌عبور",
                          style: buttonLG
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32,),
              ],
            ),
          ),
        );
      },
    );
  }

}

