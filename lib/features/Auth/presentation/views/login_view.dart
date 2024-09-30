import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';
import 'package:meem/features/Auth/presentation/widgets/custom_bottom.dart';
import 'package:meem/features/Auth/presentation/widgets/email_password.dart';

import '../widgets/social_signins.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text("Welcome\nBack!",
                        style: TextStyle(
                            fontSize: 32.sp,
                            fontFamily:StringManager.fontFamily,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.textBlue))
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
            const     EmailAndPassword(),

                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle forgot password action here
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ColorsManager.mainPink,

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomBottom(text: "Login", onPressed: () {}),
                SizedBox(
                  height: 50.h,
                ),
              const  SocialSignIn(textBegin: "Create An Account ",textEnd: "Sign Up",)

              ],
            ),
          ),
        ),
      )),
    );
  }
}
