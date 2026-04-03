import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle medium20WhiteColor = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle medium20BlackColor = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle medium18WhiteColor = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle medium18MainColor = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.mainLightColor,
  );
  static TextStyle regular16GreyLightMode = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
  static TextStyle regular16GreyDarkMode = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteDarkColor,
  );
  static TextStyle semi20Black = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static TextStyle semi20White = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
  static TextStyle regular14WhiteDarkColor = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteDarkColor,
  );
  static TextStyle regular14MainDarkColor = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mainDarkColor,
  );
  static TextStyle regular14MainLightColor = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mainLightColor,
  );
  static TextStyle regular14White = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static TextStyle semi14White = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );

}