import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/edit_password.dart';
import 'package:gymjibi/edit_phone_number.dart';
import 'package:gymjibi/screens/login.dart';
import 'package:gymjibi/screens/textFiled.dart';
import 'package:get/get.dart';

//import 'package:datepicker_dropdown/datepicker_dropdown.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {@override

  static String phoneNumber = "";

  bool editField = false;

  List<String> day = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
  String? hintDay;

  List<String> month = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'اذر',
    'دی',
    'بهمن',
    'اسفند'
  ];
  String? hintMonth;

  List<String> year = [
    '1380',
    '1381',
    '1382',
    '1383',
    '1384',
    '1385',
    '1386',
    '1387',
    '1388',
    '1389',
    '1390',
    '1391',
    '1392',
    '1393',
    '1394',
    '1395',
    '1396',
    '1397',
    '1398',
    '1399',
    '1400'
  ];
  String? hintYear;

  List<String> gender = [
    'مرد',
    'زن',
  ];
  String? hintGender;

  List<String> city = [
    'یزد',
    'تهران',
  ];
  String? hintCity;

  FocusNode myTextFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // final controllerName = TextEditingController();

    var width = MediaQuery.of(context).size.width;


    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "اطلاعات شخصی",
                            style: h4,
                          ),
                          if (editField == false)
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    editField = true;

                                    // statusTextField = !statusTextField!;
                                  });
                                  print(editField);
                                },
                                child: Text(
                                  "ویرایش",
                                  style: buttonSM,
                                )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                editField = true;
                              });
                            },
                            child: DropdownButtonFormField<String>(
                              icon: const Icon(Icons.keyboard_arrow_down_rounded),
                              iconDisabledColor: cde,
                              decoration: InputDecoration(
                                enabled: editField,
                                labelText: "روز",
                                labelStyle: bodyXL.copyWith(fontSize: 19.sp, color: editField?c75:ccb, fontWeight: FontWeight.w100),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: cde,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: ccb,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: ccb,
                                  ),
                                ),
                              ),
                              elevation: 1,
                              dropdownColor: white,
                              onChanged: (String? newValue) {
                                setState(() {
                                  // dropdownValue = newValue!;
                                  hintDay = newValue!;
                                });
                              },
                              hint: (hintDay != null)
                                  ? Text("$hintDay", style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300))
                                  : null,
                              items: (editField == true)
                                  ? day
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300),
                                            ),
                                          ))
                                      .toList()
                                  : null,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                editField = true;
                              });
                            },
                            child: DropdownButtonFormField<String>(
                              icon: const Icon(Icons.keyboard_arrow_down_rounded),
                              iconDisabledColor: cde,
                              decoration: InputDecoration(
                                enabled: editField,
                                labelText: "ماه",
                                labelStyle: bodyXL.copyWith(fontSize: 19.sp, color: editField?c75:ccb, fontWeight: FontWeight.w100),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                    color: cde,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                    color: ccb,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                    color: ccb,
                                  ),
                                ),
                              ),
                              elevation: 1,
                              dropdownColor: white,
                              onChanged: (String? newValue) {
                                setState(() {
                                  // dropdownValue = newValue!;
                                  hintMonth = newValue!;
                                });
                              },
                              hint: (hintMonth != null)
                                  ? Text("$hintMonth", style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300))
                                  : null,
                              items: (editField == true)
                                  ? month
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300),
                                            ),
                                          ))
                                      .toList()
                                  : null,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                editField = true;
                              });
                            },
                            child: DropdownButtonFormField<String>(
                              icon: const Icon(Icons.keyboard_arrow_down_rounded),
                              iconDisabledColor: cde,
                              decoration: InputDecoration(
                                enabled: editField,
                                labelText: "سال",
                                labelStyle: bodyXL.copyWith(fontSize: 19.sp, color: editField?c75:ccb, fontWeight: FontWeight.w100),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: cde,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: ccb,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: ccb,
                                  ),
                                ),
                              ),
                              elevation: 1,
                              dropdownColor: white,
                              onChanged: (String? newValue) {
                                setState(() {
                                  // dropdownValue = newValue!;
                                  hintYear = newValue!;
                                });
                              },
                              hint: (hintYear != null)
                                  ? Text("$hintYear", style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300))
                                  : null,
                              items: (editField == true)
                                  ? year
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300),                                          ),
                                          ))
                                      .toList()
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          editField = true;
                        });
                      },
                      child: TextFieldWidget(
                        // controller: controllerName,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                        enable: editField,
                        labelText: "نام و نام خانوادگی",
                        labelStyle: bodyXL.copyWith(fontSize: 19.sp, color: editField?c75:ccb, fontWeight: FontWeight.w100),
                        style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          editField = true;//قتی این کار انجام شد دستور بعد را اجرا ن
                          myTextFieldFocusNode.requestFocus();
                        });
                      },
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        iconDisabledColor: cde,
                        focusNode: myTextFieldFocusNode,
                        decoration: InputDecoration(
                          enabled: editField,
                          labelText: "جنسیت",
                          labelStyle: bodyXL.copyWith(fontSize: 19.sp, color: editField?c75:ccb, fontWeight: FontWeight.w100),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: cde,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ccb,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ccb,
                            ),
                          ),
                        ),
                        elevation: 1,
                        dropdownColor: white,
                        // value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            // dropdownValue = newValue!;
                            hintGender = newValue!;
                          });
                        },
                        hint: (hintGender != null)
                            ? Text("$hintGender", style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300),)
                            : null,
                        items: (editField == true)
                            ? gender
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300),
                                      ),
                                    ))
                                .toList()
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          editField = true;
                        });
                      },
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        iconDisabledColor: cde,
                        decoration: InputDecoration(
                          enabled: editField,
                          labelText: "شهر",
                          labelStyle: bodyXL.copyWith(fontSize: 19.sp, color: editField?c75:ccb, fontWeight: FontWeight.w100),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: cde,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ccb,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ccb,
                            ),
                          ),
                        ),
                        elevation: 1,
                        dropdownColor: white,
                        onChanged: (String? newValue) {
                          setState(() {
                            // dropdownValue = newValue!;
                            hintCity = newValue!;
                          });
                        },
                        hint: (hintCity != null)
                            ? Text("$hintCity", style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300))
                            : null,
                        items: (editField == true)
                            ? city
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: bodyXL.copyWith(color: editField?secondary:c75,fontWeight: FontWeight.w300),
                                      ),
                                    ))
                                .toList()
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (editField == true)
                      Column(
                        children: [
                          Container(
                            width: width,
                            height: 0.5,
                            color: b01,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              color: b01.withOpacity(0.1),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      editField = false;
                                    });
                                  },
                                  child: Container(
                                    width: 120,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(width: 1, color: cMain),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "انصراف",
                                      style: buttonSM,
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 120,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color: cMain,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "تایید",
                                      style: buttonSMw,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                //padding: EdgeInsets.symmetric(vertical: 15 ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "شماره موبایل",
                              style: bodyLG,
                            ),
                            Text(
                              phoneNumber,
                              style: bodyXL,
                            ),
                            // Text(EditPhoneNumber.newNumber.text,style: bodyXL,)
                            /*(EditPhoneNumber.newNumber.text !="")?
                          Text("${EditPhoneNumber.newNumber.text}",style: Body_XL,):
                          Text("09132506060",style: Body_XL,),*/
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              EditPhoneNumber.bottomSheetConfirmCode(
                                context,
                              );
                            },
                            child: Text(
                              "ویرایش",
                              style: buttonSM,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    color: cf9,
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "رمز عبور",
                              style: bodyLG,
                            ),
                            Text(
                              "*********",
                              style: bodyXL,
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              EditPassword.bottomSheetPhoneNumber(context);
                            },
                            child: Text(
                              "ویرایش",
                              style: buttonSM,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    color: cf9,
                    height: 2,
                  ),
/*
                Padding(
                  padding: const EdgeInsets.all( 15 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ایمیل",style: Body_LG,),
                          Text("sadasfef@gmail.com",style: Body_XL,),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                          child: Text("ویرایش",style: Button_SM,)
                      ),
                    ],
                  ),
                ),
*/
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
