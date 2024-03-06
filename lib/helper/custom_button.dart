import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';



class MyCustomButton extends StatelessWidget {
  final double? height, width, fontSize;
  final String title;
  final bool loading;
  final VoidCallback? onTap;
  final Color? color, textColor;
  final bool enable;
  final String? nameImage;
  final String? nameImageRight;
  final bool? visibleImage;
  final bool? visibleImageRight;
  final double? borderRadius;
  final Color? borderColor;
  final int? fontSizeTitle;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;

  const MyCustomButton({
    Key? key,
    required this.title,
    required this.loading,
    this.fontSize,
    this.height,
    this.width,
    this.onTap,
    this.color,
    this.textColor,
    this.enable = true,
    this.nameImage,
    this.nameImageRight,
    this.visibleImage = false,
    this.visibleImageRight = false,
    this.borderRadius,
    this.borderColor,
    this.fontSizeTitle,
    this.fontWeight,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 49.h,
      width: width ?? 319.w,
      child: MaterialButton(
          onPressed: !enable || loading ? null : onTap,
          color:color?? cMain,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 50),
              side: BorderSide(
                  width: 1, color: borderColor ?? Colors.transparent)),
          child: loading
              ? Container(
                  height: height ?? 49.h,
                  width: width ?? 319.w,
                  decoration: BoxDecoration(
                      color:color??cMain.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(borderRadius ?? 50),
                      border: Border.all(
                          width: 1, color: borderColor ?? Colors.transparent)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: visibleImage ?? false,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          nameImage ?? "",
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          buttonLG.copyWith(
                            fontSize: fontSize ?? 14,
                            color: textColor ?? white,
                            fontWeight: fontWeight ?? FontWeight.normal,
                          ),
                    ),
                    Visibility(
                      visible: visibleImageRight ?? false,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 26),
                        child: SvgPicture.asset(
                          nameImageRight ?? "",
                          height: 24,
                          width: 24,
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
