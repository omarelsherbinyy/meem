import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/features/Auth/presentation/widgets/custom_text_form_field.dart';

class EmailAndPasswod extends StatelessWidget {
  const EmailAndPasswod({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextFormField(hintText: "Email", validator: (value) {}),
        SizedBox(
          height: 20.h,
        ),

         CustomTextFormField(hintText: "Pasword", validator: (value) {}),


      ],
    ));
  }
}
