import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymjibi/constants.dart';


class TextFieldWidget extends StatelessWidget {
  final labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final String? errorText;
  final icon;
  final bool obscureText;
  final bool digitsOnly;
  final bool noSpaces;
  final int? lengthLimitInput;
  final suffixIcon;
  final controller;
  final bool? enable;
  final TextDirection? inputTextDirection;
  final TextAlign? textAlign;
  final TextInputType? textInputType;
  final EdgeInsetsGeometry? contentPadding;
  final void Function()? onTap;
  final FocusNode? focusNode;


  const TextFieldWidget({super.key,
    @required this.controller,
    @required this.labelText,
    this.labelStyle,
    this.style,
    this.errorText,
    this.digitsOnly = false,
    this.noSpaces = false,
    this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.enable,
    this.inputTextDirection,
    this.textAlign,
    this.textInputType,
    this.lengthLimitInput,
    this.contentPadding,
    this.onTap,
    this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [
        if(digitsOnly==true)
        FilteringTextInputFormatter.digitsOnly,

        if(noSpaces==true)
        FilteringTextInputFormatter.deny(RegExp(r"\s")),

        if(lengthLimitInput!=null)
        LengthLimitingTextInputFormatter(lengthLimitInput),
      ],
      keyboardType: textInputType??TextInputType.text,
      enabled: enable?? true,
      textAlign: textAlign??TextAlign.start,
      textDirection: inputTextDirection??TextDirection.rtl,
      style: style??bodyXLs,
      obscureText: obscureText,
      obscuringCharacter: "●",
      textAlignVertical: TextAlignVertical.center,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? const EdgeInsets.all(10),
        // contentPadding: ,
        fillColor: Colors.transparent,
        labelText: labelText,
        filled: true,
        labelStyle: labelStyle??bodyXL75.copyWith(fontWeight: FontWeight.w100),
        errorText: errorText,
        errorStyle: bodyXS.copyWith(color: redText),
        // border: InputBorder.none,
        // border: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: cde,
          ),),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ccb,
            ),),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: ccb,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: ccb,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: ccb,
          ),
        ),

        // icon: icon ?? null,

        // prefixIcon: icon ?? null,

        icon: icon ?? null,

        // prefix: icon2 ?? null,

        // prefix: Container(color: Colors.red,child: icon,margin: EdgeInsets.only(top: 10,bottom: 0),) ?? null,
          // isCollapsed: true,

        // prefixIconConstraints: BoxConstraints.expand(),

        // prefixIcon: icon ?? null,
        // (icon != null) ? Padding(padding: const EdgeInsets.all(12),child: icon,) : const SizedBox(),

        suffixIcon: suffixIcon,
      ),
      onTap: onTap,
    );
  }

}
