import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,


        textTheme: TextTheme(
        // displayLarge: AppStyles.styleMedium16(context),
        // displayMedium: AppStyles.styleMedium16(context),
        // bodyLarge: AppStyles.styleMedium16(context),
        // labelLarge: AppStyles.styleMedium16(context),
        // bodySmall: AppStyles.styleMedium16(context),
        //Regular
        titleLarge: AppStyles.styleRegular12(context),
        bodyMedium: AppStyles.styleRegular14(context),
        
        //medume
        labelMedium: AppStyles.styleMedium16(context),



        ),



      colorScheme: const ColorScheme.light(
        primary: Colors.white,
        secondary: Colors.white,
        surface: Colors.white,
        // background: Colors.white,
        error: Colors.white,
      ),


        elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.amber
        ),),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.black54,
      scaffoldBackgroundColor: Colors.black,


        textTheme: TextTheme(
          //Regular
        titleLarge: AppStyles.styleRegular12(context).copyWith(color: Colors.white),
        bodyMedium: AppStyles.styleRegular14(context).copyWith(color: Colors.white),
        
        //medume
        labelMedium: AppStyles.styleMedium16(context).copyWith(color: Colors.white),


        displayLarge: AppStyles.styleMedium16(context).copyWith(color: Colors.white),
        displayMedium: AppStyles.styleMedium16(context).copyWith(color: Colors.white),
        bodyLarge: AppStyles.styleMedium16(context).copyWith(color: Colors.white),
        labelLarge: AppStyles.styleMedium16(context).copyWith(color: Colors.white),
        bodySmall: AppStyles.styleMedium16(context).copyWith(color: Colors.white),
        
        ),



        colorScheme: const ColorScheme.light(
        primary: Colors.grey,
        secondary: Colors.black45,
        surface: Colors.black54,
        // background: Colors.black54,
        error: Colors.black54,
      ),


      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.amber
        )
         
      )
    );
  }
}
