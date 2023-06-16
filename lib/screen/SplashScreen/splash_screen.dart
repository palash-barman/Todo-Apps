import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_apps/local/my_local.dart';
import 'package:todo_apps/utils/colors.dart';
import 'package:todo_apps/utils/images.dart';

import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextPage();

    super.initState();
  }

  nextPage() {
    Future.delayed(const Duration(seconds: 3), () async {
      bool isOnBoard = await MyPreference.getOnBoard();
      if (isOnBoard) {
        Get.offNamed(Routes.homeScreen);
      } else {
        Get.offNamed(Routes.onboardScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Image.asset(
          AppImage.appIcon,
          color: AppColors.backgroundColor,
          height: 150.h,
          width: 150.h,
        ),
      ),
    );
  }
}
