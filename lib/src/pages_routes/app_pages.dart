import 'package:get/get.dart';
import 'package:quitanda_virtual/src/pages/auth/view/sign_in_screen.dart';
import 'package:quitanda_virtual/src/pages/auth/view/sign_up_screen.dart';
import 'package:quitanda_virtual/src/pages/base/base_screen.dart';
import 'package:quitanda_virtual/src/pages/base/binding/navigation_binding.dart';
import 'package:quitanda_virtual/src/pages/cart/binding/cart_binding.dart';
import 'package:quitanda_virtual/src/pages/home/home_biding.dart/home_biding.dart';
import 'package:quitanda_virtual/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const BaseScreen(),
      bindings: [
        NavigationBinding(),
        HomeBinding(),
        CartBinding(),
      ],
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
