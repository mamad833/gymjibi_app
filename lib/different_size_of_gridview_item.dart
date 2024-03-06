// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vibe_app/core/utils/app_color.dart';
// import 'package:vibe_app/core/utils/style_text_app.dart';
//
// class GenerateChipe extends StatelessWidget {
//   List<String> texts = [];
//   List<String>? icons = [];
//
//   final Color? backgroundColor;
//   final TextStyle? textStyle;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final double? h;
//   final Color? borderColor;
//
//   GenerateChipe({
//     Key? key,
//     required this.texts,
//     this.icons,
//     this.backgroundColor,
//     this.textStyle,
//     this.borderRadius,
//     this.padding,
//     this.h,
//     this.borderColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: texts
//           .map((el) => _MyButton(
//                 name: el,
//                 // icon: icons,
//                 h: h,
//                 backgroundColor: backgroundColor,
//                 textStyle: textStyle,
//                 borderRadius: borderRadius,
//                 padding: padding,
//                 borderColor: borderColor,
//               ))
//           .toList(),
//     );
//   }
// }
//
// class _MyButton extends StatelessWidget {
//   final name;
//
//   // var icon;
//   final backgroundColor;
//   final textStyle;
//   final borderRadius;
//   final padding;
//   final h;
//   final borderColor;
//
//   _MyButton({
//     required this.name,
//     // required this.icon,
//     this.backgroundColor,
//     this.textStyle,
//     this.borderRadius,
//     this.padding,
//     this.borderColor,
//     this.h,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         height: h ?? 26.h,
//         margin: const EdgeInsets.only(right: 5, bottom: 8),
//         decoration: BoxDecoration(
//             border: Border.all(
//                 width: 0.5, color: borderColor ?? Colors.transparent),
//             borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
//             color: backgroundColor ?? AppColor.white.withOpacity(0.07)),
//         padding:
//             padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
//         child: Center(
//           child: Wrap(
//             crossAxisAlignment: WrapCrossAlignment.center,
//             children: [
//               Text(
//                 name,
//                 style: textStyle ??
//                     poppins.copyWith(
//                         fontSize: 12.sp, fontWeight: FontWeight.w400),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';

class GenerateChipe extends StatelessWidget {
  var texts = [];
  late Icon? icons = [] as Icon?;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Color? borderColor;

  GenerateChipe({
    Key? key,
    required this.texts,
    this.icons,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius,
    this.padding,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: texts
          .map((el) => _MyButton(
        name: el,
        icon: icons,
        textStyle: textStyle,
        padding: padding,
      ))
          .toList(),
    );
  }
}

class _MyButton extends StatelessWidget {
  final name;
  var icon;
  final textStyle;
  final padding;

  _MyButton({
    required this.name,
    required this.icon,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
      ),
      // padding: padding ?? EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // Icon(
          //   Icons.ac_unit_sharp,
          //   color: AppColor.white,
          // ),
          SizedBox(
            width: 8,
          ),
          Text(
            name,
            style: textStyle ??
                bodyXLs
                // poppins.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}