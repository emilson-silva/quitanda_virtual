import 'package:get/get.dart';
import 'package:quitanda_virtual/src/pages/auth/sign_in_screen.dart';
import 'package:quitanda_virtual/src/pages/auth/sign_up_screen.dart';
import 'package:quitanda_virtual/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/signIn',
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignUpScreen(),
    ),
  ];
}
