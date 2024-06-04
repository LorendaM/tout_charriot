import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppTextStyle {
  static TextStyle title({Color? color}) {
    return GoogleFonts.poppins(
      fontSize: 32,
      color: color ?? AppColor.blackColor,
      fontWeight: FontWeight.w700,
    );
  } 

  static TextStyle secondTitle({Color? color,double? size, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
      fontSize: size ?? 16,
      color: color?? AppColor.blackColor,
      fontWeight: fontWeight ?? FontWeight.w700
    );
  }

  static TextStyle text({Color? color, bool isunderline = false}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      color: color ?? AppColor.blackColor,
      fontWeight: FontWeight.w500,
      decoration: isunderline ? TextDecoration.lineThrough : TextDecoration.none
    );
  }

  static TextStyle textBold({Color? color, bool isunderline = false, double? size}) {
    return GoogleFonts.poppins(
      fontSize: size ?? 14,
      color: color ?? AppColor.blackColor,
      fontWeight: FontWeight.w700,
      decoration: isunderline ? TextDecoration.underline : TextDecoration.none
    );
  }

  static TextStyle secondtext({Color? color, bool isunderline = false, double? size}) {
    return GoogleFonts.poppins(
      fontSize: size ?? 13,
      color: color ?? AppColor.blackColor,
      fontWeight: FontWeight.w500,
      decoration: isunderline ? TextDecoration.lineThrough : TextDecoration.none
    );
  }

  static TextStyle textSmall({Color? color, bool isunderline = false, double? size}) {
    return GoogleFonts.poppins(
      fontSize: size ?? 10,
      color: color ?? AppColor.blackColor,
      fontWeight: FontWeight.w400,
      decoration: isunderline ? TextDecoration.underline : TextDecoration.none
    );
  } 

  static TextStyle textSmallBold({Color? color, bool isunderline = false, double? size}) {
    return GoogleFonts.poppins(
      fontSize: size ?? 10,
      color: color ?? AppColor.blackColor,
      fontWeight: FontWeight.w700,
      decoration: isunderline ? TextDecoration.lineThrough : TextDecoration.none
    );
  } 

}
