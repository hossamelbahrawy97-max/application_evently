import 'package:application_evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    cardColor: AppColors.mainLightColor,
    dividerColor: AppColors.strokeWhiteColor,
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.lightBgColor,

textTheme:
      TextTheme(
        titleSmall: AppStyles.semi20Black,
        bodySmall:AppStyles.regular16GreyLightMode ,
        displayMedium:AppStyles.semi14White,
        displaySmall: AppStyles.regular14MainLightColor,
        labelMedium: AppStyles.medium18MainColor,
        headlineMedium: AppStyles.medium20WhiteColor,
      )
  );
  static final ThemeData darkMode = ThemeData(
    cardColor: AppColors.mainDarkColor,
    dividerColor: AppColors.strokeDarkColor,
    primaryColor:AppColors.inputStrokeDarkColor ,
    scaffoldBackgroundColor: AppColors.darkBgColor,
    textTheme: TextTheme(
        titleSmall: AppStyles.semi20White,
        bodySmall:AppStyles.regular16GreyDarkMode ,
        displayMedium:AppStyles.semi14White,
        displaySmall: AppStyles.regular14MainDarkColor,
        labelMedium: AppStyles.medium18WhiteColor,
        headlineMedium:AppStyles.medium20WhiteColor,
    )

  );
}