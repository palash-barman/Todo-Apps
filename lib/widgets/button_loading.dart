import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 15.h,
        width: 15.h,
        child: CircularProgressIndicator(
          color: AppColors.backgroundColor,
        ));
  }
}
