import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/config/router/app_router.dart';
import 'package:meem/config/router/routes.dart';

class MeemApp extends StatelessWidget {
  const MeemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meem',
          initialRoute: Routes.OnboardingLoginSignup,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
