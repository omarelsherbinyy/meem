import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';
import 'package:meem/features/Auth/presentation/widgets/custom_bottom.dart';
import 'package:meem/features/Auth/presentation/widgets/email_password.dart';
import '../widgets/social_signins.dart';

import 'package:meem/config/router/routes.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start, // Align title to the left
                children: [
                  SizedBox(height: 10.h),

                  // Title
                  Text(
                    "Welcome\nBack!",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontFamily: StringManager.fontFamily,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.textBlue,
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // Email and Password Fields (without confirm password for login)
                  const EmailAndPassword(),

                  // Forgot password option
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
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
                  SizedBox(height: 30.h),

                  // Login button
                  CustomBottom(
                    text: "Login",
                    onPressed: () {
                      // Handle login logic here
                    },
                  ),
                  SizedBox(height: 50.h),

                  // Social sign-in options (Sign up suggestion)
                  SocialSignIn(onTap:(){Navigator.pushNamed(context, Routes.Signup);} ,
                    textBegin: "Create An Account ",
                    textEnd: "Sign Up",

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
