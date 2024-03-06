/*
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibe_app/core/utils/app_color.dart';
import 'package:vibe_app/core/utils/image_app.dart';

import '../utils/style_text_app.dart';
import 'constants.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? suffixText;
  final String? icText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputAction action;
  final Function()? onTap;
  final TextInputType? type;
  final bool isPassword;
  final int line;
  final String suffixIcon;
  final String prefixIcon;
  final String icon;
  final TextDirection? hintTextDirection;
  final double? hintFontSize;
  final double? fontSize;
  final TextAlign? align;
  final TextStyle? hintStyle;
  final bool? enable;
  final String? prefixTitle;
  final TextStyle? prefixTitleStyle;
  final double? cursorHeight;
  final contentPadding;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.isPassword = false,
    this.onChanged,
    this.hint,
    this.line = 1,
    this.action = TextInputAction.next,
    this.type,
    this.onTap,
    this.suffixIcon = "",
    this.prefixIcon = "",
    this.icon = "",
    this.hintTextDirection,
    this.hintFontSize,
    this.fontSize,
    this.align,
    this.hintStyle,
    this.enable,
    this.prefixTitleStyle,
    this.prefixTitle,
    this.contentPadding,
    this.suffixText,
    this.icText,
    this.cursorHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enable ?? true,
      controller: controller,
      onChanged: onChanged,
      textInputAction: action,
      keyboardType: type,
      maxLines: line,
      style: poppins.copyWith(
        fontSize: fontSize ?? 16.sp,
        decoration: TextDecoration.none,
      ),
      textAlign: align ?? TextAlign.left,
      obscureText: isPassword,
      cursorHeight:cursorHeight?? 20.h,
      inputFormatters: [
        LengthLimitingTextInputFormatter(300),
      ],
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 12.h,
            ),
        hintTextDirection: hintTextDirection ?? TextDirection.rtl,
        prefixIcon: prefixIcon.isEmpty
            ? null
            : Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(
                    onPressed: onTap,
                    icon: SvgPicture.asset(prefixIcon,height: 17.r,width: 17.w,color: AppColor.white,fit: BoxFit.cover),
                  ),
                  Text(
                    prefixTitle == null ? "" : prefixTitle!,
                    style: prefixTitleStyle ??
                        poppins.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
        suffixIcon: suffixIcon.isEmpty
            ? null
            : IconButton(onPressed: onTap, icon: SvgPicture.asset(suffixIcon)),

        hintText: hint,

        icon: icon!.isEmpty
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 0),
                child: SvgPicture.asset(icon),
              ),
        // fillColor: white.withOpacity(0.04),
        hintStyle: hintStyle ?? Body_XL,
        border: InputBorder.none,

      ),
    );
  }
}
*/
