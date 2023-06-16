import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle h1(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
            fontSize: 22.sp,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h2({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
            fontSize: 20.sp,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h3(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 18.sp,
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h4(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 16.sp,
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h5(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 14.sp,
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h6(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 12.sp,
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle h7(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 10.sp,
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight ?? FontWeight.w400));
  }

  static TextStyle customSize(
      {Color? color,
      required double size,
      String? family,
      double? letterSpacing,
      FontStyle? fontStyle,
      FontWeight? fontWeight}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: size,
        letterSpacing: letterSpacing,
        fontFamily: family ?? "Montserrat");
  }
}
