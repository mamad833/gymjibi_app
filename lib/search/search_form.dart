import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gymjibi/search/filters.dart';

import '../../../../constants.dart';
import '../config/hive_service/hive_service.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide.none,
);

enum tab { a, b, c }

enum Answer { yes, no }

Map<int, tab?> tabVal = {};
Map<int, Answer?> answerVal = {};

class SearchForm extends StatefulWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        //textDirection: TextDirection.rtl,
        //textAlign: TextAlign.left,
        style: bodyLG,
        onSaved: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: cSearch,
          hintText: "جستجو...",
          hintStyle: bodyLG,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              onTap: () {

                Get.to(Filters.new,
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 800));
                /*showDialog(
                  context: context,
                  builder: (context) => Filters(),
                );*/
              },
              child: Container(
                height: 58,
                width: MediaQuery.of(context).size.width / 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: black,
                      width: 1,
                      height: 40,
                    ),
                    Text(
                      "پیشرفته",
                      style: bodyLG,
                      textAlign: TextAlign.center,
                    ),
                    SvgPicture.asset(height: 42.r,width: 42.r,
                      "assets/icons/search.svg",
                      color: cMain,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
