import 'package:get/get.dart';
import 'package:todo_apps/screen/DetailsScreen/details_screen.dart';
import 'package:todo_apps/screen/HomeScreen/home_screen.dart';
import 'package:todo_apps/screen/OnboardScreen/onboard_screen.dart';

import '../screen/SplashScreen/splash_screen.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String onboardScreen = "/onboard_screen";
  static String homeScreen = "/home_screen";
  static String todoDetails = "/todo_details_screen";
}

List<GetPage> getPage = [
  GetPage(
    name: Routes.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.onboardScreen,
    page: () => const OnboardScreen(),
  ),
  GetPage(name: Routes.homeScreen, page: () => HomeScreen()),
  GetPage(name: Routes.todoDetails, page: () => TodoDetailsScreen())
];
