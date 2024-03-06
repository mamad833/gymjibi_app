import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';

class CustomRadioButton extends StatefulWidget {
  final String title;
  final int buttonIndex;
  final int isSelect;
  final VoidCallback? onTap;

  const CustomRadioButton({
    Key? key,
    required this.title,
    required this.buttonIndex,
    required this.isSelect,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    width: 1,
                    color: widget.buttonIndex == widget.isSelect
                        ? cMain.withOpacity(0.4)
                        : c75)
            ),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  shape: BoxShape.rectangle,
                  color: widget.buttonIndex == widget.isSelect
                      ? cMain.withOpacity(0.4)
                      : Colors.transparent),
              child:
              SvgPicture.asset(
                widget.buttonIndex == widget.isSelect
                  ? 'assets/icons/verifi.svg' : 'assets/icons/verifi.svg',color:widget.buttonIndex == widget.isSelect
                  ?cMain: Colors.transparent, ),
              /*Icon(widget.buttonIndex == widget.isSelect
                  ? Icons.verified : null,size: 8,color: Colors.red,),*/
            ),
          ),
          Text(
            widget.title,
            style: bodyLG,
          ),
        ],
      ),
    );
  }
}
