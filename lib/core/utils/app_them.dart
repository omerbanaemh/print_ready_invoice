import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_clores.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xFFECEEF1),
      useMaterial3: false,


        colorScheme: const ColorScheme.light(
        primary: Colors.white,
        secondary: Color(0xFFEAF3FB),
        surface: Colors.black54,
        error: Colors.black54,
      ),
      dividerColor: AppClores.grey2,

      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 242, 241, 241),
          foregroundColor: Colors.black,
        ),
      ),

   
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppClores.grey3,
      useMaterial3: false,


      colorScheme: const ColorScheme.light(
        primary: AppClores.grey7,
        secondary: Color(0xFF1E2A36),
        surface: Colors.black54,
        error: Colors.black54,
      ),
      dividerColor: AppClores.grey2,

      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),

      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 242, 241, 241),
          foregroundColor: Colors.black,
        ),
      ),

    );
  }
}
