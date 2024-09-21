import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/theming/colors.dart';
import 'package:meem/core/widgets/email_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 51.w, vertical: 24.h),
                child: Image.asset(
                  "assets/images/Logo_Log_In.png",
                  height: 232.h,
                  width: 272.w,
                ),
              ),
               EmailAndPasswod()
            ],
           

          ),
        ),
      )),
    );
  }
}
