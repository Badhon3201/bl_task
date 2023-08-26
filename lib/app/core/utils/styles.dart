import 'package:bl_task/app/core/utils/reponsive_ui_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/color_manager.dart';

class TextStyles {
  static TextStyle hintStyle =
      TextStyle(fontWeight: FontWeight.w400, color: ColorManager.grayColor);

  static TextStyle grayBoldStyle =
      TextStyle(fontWeight: FontWeight.bold, color: ColorManager.grayColor);

  static TextStyle blackBoldStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp);

  static TextStyle poppinsStyle = GoogleFonts.poppins(
    fontSize: 10.sp,
  );

  static TextStyle titleStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    decoration: TextDecoration.underline,
    decorationThickness: 2,
    decorationColor: ColorManager.yellowColor,
    decorationStyle: TextDecorationStyle.dashed,
  );

  static TextStyle grayStyle =
      TextStyle(color: ColorManager.grayColor, fontSize: 10.sp);

  static TextStyle samiBoldGrayStyle = TextStyle(
      color: ColorManager.grayColor,
      fontSize: 11.sp,
      fontWeight: FontWeight.w600);

  static TextStyle greenBoldStyle =
      TextStyle(fontWeight: FontWeight.bold, color: ColorManager.greenColor);

  static TextStyle whiteBoldStyle =
      TextStyle(color: ColorManager.whiteColor, fontWeight: FontWeight.bold);

  static TextStyle whiteBoldLargeStyle =
      TextStyle(color: ColorManager.whiteColor, fontWeight: FontWeight.w900);

  static MaterialStateTextStyle mHintStyle = MaterialStateTextStyle.resolveWith(
      (states) => TextStyle(color: ColorManager.grayColor));
}
