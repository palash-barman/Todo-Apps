import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_apps/utils/text_style.dart';

import 'routes/routes.dart';
import 'utils/colors.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do Apps',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              elevation: 1,
              centerTitle: true,
              titleTextStyle: CustomTextStyle.h3(
                  fontWeight: FontWeight.w600,
                  color: AppColors.headerTextColor),
              backgroundColor: AppColors.backgroundColor)),
      getPages: getPage,
      initialRoute: Routes.splashScreen,
    );
  }
}
