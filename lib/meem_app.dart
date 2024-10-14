import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/config/router/app_router.dart';
import 'package:meem/config/router/routes.dart';
import 'package:meem/core/utils/di/di.dart';
import 'package:meem/features/Auth/data/repos/auth_repo.dart';
import 'package:meem/features/Auth/presentation/cubits/cubit/auth_cubit.dart';

class MeemApp extends StatelessWidget {
  const MeemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => AuthCubit(
            authRepo: git.get<AuthRepoImpl>(),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Meem',
            initialRoute:Routes.userProfile,
            //  Hive.box(Constants.tokenBox).get(Constants.tokenKey) == null
            //     ? Routes.onboardingLoginSignUp
            //     : Routes.home,
            onGenerateRoute: AppRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}