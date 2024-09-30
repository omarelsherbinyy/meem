import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';

class CustomTextFormField extends StatefulWidget {
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
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    double height = 50.h;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: height, // Set height directly here
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        obscureText: widget.isObsecureText ?? false,
        style: widget.inputTextStyle ?? TextStyle(fontSize: 16.sp),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h), // Adjust padding to increase space inside
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: StringManager.fontFamily,
            color: ColorsManager.gray,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: widget.enableBorder ?? customBorder(),
          focusedBorder: widget.focusedBorder ?? customBorder(ColorsManager.lightPink),
          errorBorder: widget.errorBorder ?? customBorder(Colors.red),
          errorStyle: TextStyle(fontSize: 12.sp),
          focusedErrorBorder: widget.focusedErrorBorder ?? customBorder(Colors.red),
        ),
        validator: (value) => widget.validator(value),
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
