import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
        this.contentPadding,
        this.focusedBorder,
        this.enableBorder,
        this.errorBorder,
        this.focusedErrorBorder,
        this.inputTextStyle,
        required this.hintText,
        this.onSaved,
        this.onChanged,
        this.isObsecureText,
        this.suffixIcon,
        this.prefixIcon,
        this.backgroundColor,
        required this.validator,
        this.controller});

  final EdgeInsetsDirectional? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enableBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool? isObsecureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final Function(String?) validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    double height = 55.h;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: height, // Set height directly here
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: isObsecureText ?? false,
        style: inputTextStyle ?? TextStyle(fontSize: 16.sp),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h), // Adjust padding to increase space inside
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorsManager.gray,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: enableBorder ?? customBorder(),
          focusedBorder: focusedBorder ?? customBorder(ColorsManager.lightPink),
          errorBorder: errorBorder ?? customBorder(Colors.red),
          errorStyle: TextStyle(fontSize: 12.sp),
          focusedErrorBorder: focusedErrorBorder ?? customBorder(Colors.red),
        ),
        validator: (value) => validator(value),
      ),
    );
  }

  OutlineInputBorder customBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color ?? ColorsManager.lightGray,
        width: 2,
      ),
    );
  }
}
