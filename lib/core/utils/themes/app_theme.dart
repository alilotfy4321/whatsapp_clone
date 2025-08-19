import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/utils/colors_manager/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    
    scaffoldBackgroundColor: ColorsManager.whiteColor,
    appBarTheme:  AppBarTheme(
      backgroundColor: ColorsManager.whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsManager.textColor),
      titleTextStyle: TextStyle(
        color: ColorsManager.accentColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: ColorsManager.whiteColor, // Set the status bar color
        statusBarIconBrightness: Brightness.dark, // Dark icons for light theme
        statusBarBrightness: Brightness.light, // For iOS
      ),
    ),
    
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorsManager.accentColor, fontSize: 22.sp,fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: ColorsManager.textColor, fontSize: 18.sp),
      bodySmall: TextStyle(color: ColorsManager.textColor, fontSize: 14.sp),
    ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
  backgroundColor: ColorsManager.whiteColor,
  selectedItemColor: ColorsManager.textColor,
  unselectedItemColor: ColorsManager.textColor.withValues(alpha: 0.6),
  selectedIconTheme: IconThemeData(
    color: ColorsManager.textColor,
    size: 26.sp,
  ),
  unselectedIconTheme: IconThemeData(
    color: ColorsManager.textColor.withValues(alpha: 0.6),
    size: 24.sp,
  ),
  selectedLabelStyle: TextStyle(
    fontWeight: FontWeight.bold, // <-- خليها تتحكم بس في الوزن
    fontSize: 14.sp,
  ),
  unselectedLabelStyle: TextStyle(
    fontSize: 13.sp,
  ),
  showSelectedLabels: true,
  showUnselectedLabels: true,
  elevation: 2,
),

    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.textColor).copyWith(
      surface: ColorsManager.whiteColor,
      primary: ColorsManager.textColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.textColor,
    appBarTheme:  AppBarTheme(
      backgroundColor: ColorsManager.textColor,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsManager.whiteColor),
      actionsIconTheme: IconThemeData(color: ColorsManager.whiteColor),
      titleTextStyle: TextStyle(
        color: ColorsManager.whiteColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: ColorsManager.textColor, // Set the status bar color
        statusBarIconBrightness: Brightness.light, // Dark icons for light theme
        statusBarBrightness: Brightness.dark, // For iOS
      ),
    ),
  textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorsManager.whiteColor, fontSize: 22.sp,fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: ColorsManager.whiteColor, fontSize: 18.sp),
      bodySmall: TextStyle(color: ColorsManager.whiteColor, fontSize: 14.sp),
    ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.textColor,
      selectedItemColor: ColorsManager.whiteColor,
      unselectedItemColor: ColorsManager.whiteColor,
      selectedIconTheme: IconThemeData(
        color: ColorsManager.whiteColor,
        size: 16,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorsManager.whiteColor,
        size: 24,
      ),
      selectedLabelStyle: TextStyle(
        color: ColorsManager.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      unselectedLabelStyle: TextStyle(
        color: ColorsManager.textColor.withValues(alpha: 0.6),
        fontSize: 13,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 2,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.whiteColor).copyWith(
      surface: ColorsManager.textColor,
      primary: ColorsManager.whiteColor,
    ),
  );
}
