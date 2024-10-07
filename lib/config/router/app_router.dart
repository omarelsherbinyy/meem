import 'package:flutter/material.dart';
import 'package:meem/config/router/routes.dart';
import 'package:meem/features/Auth/presentation/views/login_view.dart';
import 'package:meem/features/Auth/presentation/views/logout_view.dart';
import 'package:meem/features/cart/presentation/views/cart_view.dart';
import 'package:meem/features/favorites/presentation/views/favorites_view.dart';
import 'package:meem/features/home/presentation/view/home_view.dart';
import 'package:meem/features/onBoarding/presentation/view/onboarding_view.dart';
import 'package:meem/features/user_profile/presentation/views/user_profile_view.dart';

import '../../features/Auth/presentation/views/forgot_password_view.dart';
import '../../features/Auth/presentation/views/onboarding_login_signup.dart';
import '../../features/Auth/presentation/views/signup_view.dart';
import '../../features/Products/presentation/product_view.dart';
class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );
      case Routes.logIn:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routes.logOut:
        return MaterialPageRoute(
          builder: (context) => const LogoutView(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.favorites:
        return MaterialPageRoute(
          builder: (context) => const FavoritesView(),
        );
      case Routes.userProfile:
        return MaterialPageRoute(
          builder: (context) => const UserProfileView(),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (context) => const CartView(),
        );
      case Routes.Signup:
        return MaterialPageRoute(
          builder: (context) => const SignupView(),
        );

      case Routes.ProductDetailsPage:
        return MaterialPageRoute(builder: (context)=>ProductDetailsPage());
      case Routes.ForgotPassword:
        return MaterialPageRoute(builder: (context)=> ForgotPasswordView());
      case Routes.OnboardingLoginSignup:
        return MaterialPageRoute(builder: (context)=>const OnboardingLoginSignup());

     
      default:
        return unDefineRoute();
    }
  }
}

Route unDefineRoute() {
  return MaterialPageRoute(
    builder: (context) => const Scaffold(
      body: Center(
        child: Text('No route defined'),
      ),
    ),
  );
}
