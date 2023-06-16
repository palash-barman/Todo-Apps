import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, this.maxLines, this.controller});
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          border: _outLineBorder(),
          enabledBorder: _outLineBorder(),
          focusedBorder: _outLineBorder(),
          fillColor: AppColors.mainColor.withOpacity(0.05),
          filled: true),
    );
  }

  _outLineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColors.mainColor.withOpacity(0.3)));
  }
}
