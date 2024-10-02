import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';
import 'package:meem/features/Auth/presentation/widgets/custom_bottom.dart';
import 'package:meem/features/Auth/presentation/widgets/email_password.dart';

import '../../../../config/router/routes.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/social_signins.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),

                  // Title
                  Text(
                    "Create an \naccount",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontFamily: StringManager.fontFamily,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.textBlue,
                    ),
                  ),
                  SizedBox(height: 22.h),

                  // Full Name field
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      size: 24.sp,
                      color: ColorsManager.gray,
                    ),
                    hintText: "Full Name",
                    validator: (value) {
                      // Add validation logic for full name
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 22.h),

                  // Phone Number field
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.phone_iphone_outlined,
                      size: 24.sp,
                      color: ColorsManager.gray,
                    ),
                    hintText: "Phone Number",
                    validator: (value) {
                      // Add validation logic for phone number
                      if (value == null || value.isEmpty) {
                        return "Please enter your phone number";
                      }
                      // You can add more phone number validation here if necessary
                      return null;
                    },
                  ),
                  SizedBox(height: 22.h),

                  // Email and Password fields
                  const EmailAndPassword(showConfirmPassword: true),
                  SizedBox(height: 22.h),

                  // Signup button
                  CustomBottom(text: "Sign Up", onPressed: () {
                    // Handle signup button logic here
                  }),
                  SizedBox(height: 22.h),

                  // Social SignIn widget (login suggestion)
                   SocialSignIn(onTap: (){ Navigator.pushNamed(context, Routes.logIn);},

                    textBegin: "Have an Account?",
                    textEnd: " Login",
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
