import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/features/Auth/presentation/widgets/custom_text_form_field.dart';

class EmailAndPasswod extends StatelessWidget {
  const EmailAndPasswod({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          prefixIcon: Icon(Icons.person_outline_rounded  ,size: 26.sp,color: ColorsManager.gray,),
            hintText: "Email", validator: (value) {}),
        SizedBox(
          height: 30.h,
        ),

         CustomTextFormField(prefixIcon: Icon(Icons.lock_outline_rounded  ,size: 24.sp,color: ColorsManager.gray,),
             hintText: "Password", validator: (value) {}),


      ],
    ));
  }
}
