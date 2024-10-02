import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/string.dart';
import '../widgets/custom_bottom.dart';

class OnboardingLoginSignup extends StatelessWidget {
  const OnboardingLoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainPink,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                height: 180.h,
              ),
              Center(
                child: Text(
                  "meem",
                  style: TextStyle(
                    fontSize: 98.sp,
                    fontFamily: StringManager.fontFamily,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  "Shop Loud, Live Bold. Make\nEvery Purchase a Statement",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontFamily: StringManager.fontFamily,
                    fontWeight: FontWeight.normal,
                    color: ColorsManager.white,
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              CustomBorderBottom(
                text: 'Login',
                onPressed: () {},
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorsManager.white,width: 1.5.sp),
                      color: ColorsManager.mainPink,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontFamily: StringManager.fontFamily,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.white,
                            ),
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
