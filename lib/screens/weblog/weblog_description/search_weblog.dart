import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gymjibi/search/filters.dart';

import '../../../../constants.dart';



const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide.none,
);
enum tab { a, b, c }
enum Answer { yes, no }
Map<int, tab?> tabVal = {};
Map<int, Answer?> answerVal = {};
class SearchWeblog extends StatefulWidget {
  const SearchWeblog({

    Key? key,
  }) : super(key: key);

  @override
  State<SearchWeblog> createState() => _SearchWeblogState();
}

class _SearchWeblogState extends State<SearchWeblog> {
  @override
  Widget build(BuildContext context) {

    return Form(
      child: TextFormField(
        //textDirection: TextDirection.rtl,
       //textAlign: TextAlign.left,
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
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/icons/search.svg",color: cMain,),
          ),

        ),
      ),
    );
  }
}
