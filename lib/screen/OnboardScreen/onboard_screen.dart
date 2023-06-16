import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_apps/local/my_local.dart';
import 'package:todo_apps/routes/routes.dart';
import 'package:todo_apps/utils/colors.dart';
import 'package:todo_apps/utils/icons.dart';
import 'package:todo_apps/utils/images.dart';
import 'package:todo_apps/utils/text.dart';
import 'package:todo_apps/utils/text_style.dart';
import 'package:todo_apps/widgets/custom_padding.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // <-------------- images -------------->
            Image.asset(
              AppImage.onboard,
              height: 200.h,
              width: 200.h,
              fit: BoxFit.fill,
            ),
            const SizedPad(20),
            // <-------------- App Name -------------->
            Text(
              AppText.todoApps,
              style: CustomTextStyle.customSize(
                  size: 24.sp,
                  fontStyle: FontStyle.italic,
                  color: AppColors.headerTextColor,
                  fontWeight: FontWeight.bold),
            ),
            // <-------------- Description -------------->
            Text(
              AppText.dontUsePaperAgain,
              style: CustomTextStyle.h3(
                  color: AppColors.contentTextColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedPad(50),

            // <-------------- Button -------------->
            ElevatedButton(
                onPressed: () async {
                  await MyPreference.setOnBoard(true);
                  Get.offNamed(Routes.homeScreen);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    fixedSize: Size(double.infinity, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText.getStarted,
                      style: CustomTextStyle.h4(
                          fontWeight: FontWeight.w600,
                          color: AppColors.backgroundColor),
                    ),
                    Image.asset(
                      AppIcons.nextIcon,
                      height: 22.h,
                      width: 22.h,
                      color: AppColors.backgroundColor,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
