import 'package:clean_arcicalcutre/presentation_layer/forget_password_view/forget_password_view.dart';
import 'package:clean_arcicalcutre/presentation_layer/login_view/login_view.dart';
import 'package:clean_arcicalcutre/presentation_layer/main_view/main_view.dart';
import 'package:clean_arcicalcutre/presentation_layer/on_boarding_view/On_Boarding_View.dart';
import 'package:clean_arcicalcutre/presentation_layer/register_view/register_view.dart';
import 'package:clean_arcicalcutre/presentation_layer/resorces/strings_manger.dart';
import 'package:clean_arcicalcutre/presentation_layer/splash_view/splash_view.dart';
import 'package:clean_arcicalcutre/presentation_layer/store_details/store_details.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashView = "/";
  static const String loginView = "/loginView";
  static const String registerView = "/registerView";
  static const String onboardingScreen = "/onboardingScreens";
  static const String forgetPasswordView = "/forgetPasswordView";
  static const String mainView = "/mainView";
  static const String storeDetailsView = "/storeDetailsView";
}

class GenerateRoute {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgetPasswordView:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.mainView:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsView:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Text(AppStrings.noRouteFound),
            ));
  }
}
