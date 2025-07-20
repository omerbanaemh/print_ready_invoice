// import 'package:flutter/material.dart';
// import 'package:print_ready_invoice/core/utils/app_clores.dart';

// class AppTheme {
//   static ThemeData lightTheme(BuildContext context) {
//     return ThemeData(
//       scaffoldBackgroundColor: const Color(0xFFECEEF1),
//       useMaterial3: false,


//         colorScheme: const ColorScheme.light(
//         primary: Colors.white,
//         secondary: Color(0xFFEAF3FB),
//         surface: Colors.black54,
//         error: Colors.black54,
//       ),
//       dividerColor: AppClores.grey2,

//       dialogTheme: DialogThemeData(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         elevation: 5,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//             textTheme: const TextTheme(
//         titleLarge: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Color.fromARGB(255, 1, 1, 1),
//         ),
//         bodyMedium: TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 242, 241, 241),
//           foregroundColor: Colors.black,
//         ),
//       ),

   
//     );
//   }





//   static ThemeData darkTheme(BuildContext context) {
//     return ThemeData(
//       scaffoldBackgroundColor: AppClores.grey3,
//       useMaterial3: false,


//       colorScheme: const ColorScheme.light(
//         primary: AppClores.grey7,
//         secondary: Color(0xFF1E2A36),
//         surface: Colors.black54,
//         error: Colors.black54,
//       ),
//       dividerColor: AppClores.grey2,

//       dialogTheme: DialogThemeData(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         elevation: 5,
//       ),

//       inputDecorationTheme: InputDecorationTheme(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//         hintStyle: TextStyle(color: Colors.grey[400]),
//       ),

//       textTheme: const TextTheme(
//         titleLarge: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//         bodyMedium: TextStyle(fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 242, 241, 241),
//           foregroundColor: Colors.black,
//         ),
//       ),

//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_clores.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFECEEF1),
      useMaterial3: false,
      colorScheme: const ColorScheme.light(
        primary: Colors.white,
        secondary: Color.fromARGB(255, 255, 255, 255),
        surface: Colors.black54,
        error: Colors.black54,
      ),
      dividerColor: AppClores.grey2,
      dialogTheme: _dialogTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      textTheme: textTheme(context:  context ,),
      elevatedButtonTheme: _elevatedButtonTheme(),
      
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      // primaryColor: const Color(0xFF1E2A36),
      scaffoldBackgroundColor: AppClores.dark2,
      useMaterial3: false,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF1E2A36),
        secondary: AppClores.dark1,
        surface: Colors.black54,
        error: Colors.black54,
      ),
      dividerColor: AppClores.grey2,
      dialogTheme: _dialogTheme(isDark: true),
      inputDecorationTheme: _inputDecorationTheme(isDark: true
      ),
      textTheme: textTheme(context:  context ,isDark: true),
      elevatedButtonTheme: _elevatedButtonTheme(),
    );
  }

  /// Shared DialogTheme
  static DialogThemeData _dialogTheme({bool isDark = false}) {
    return DialogThemeData(
      backgroundColor: isDark ? AppClores.dark1 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
    );
  }

  /// Shared InputDecorationTheme (with optional hint color)
  static InputDecorationTheme _inputDecorationTheme({bool isDark = false}) {
    return InputDecorationTheme(
    fillColor: isDark ? AppClores.dark2: const Color(0xFFEEF0F2),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:  BorderSide(color: isDark ? const Color(0xFFDCDCDC) : const Color(0xFFDCDCDC)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide:  BorderSide(color: isDark ? const Color(0xFFDCDCDC) : const Color(0xFFDCDCDC)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.blue),
    ),
      errorStyle: const TextStyle(color: Colors.red,),
    );
  }

  /// Light Text Theme
static TextTheme textTheme({required BuildContext context, bool isDark = false}) {
  return  TextTheme(
  // عناوين كبيرة جدًا - تستخدم في الشاشات الرئيسية أو البنرات الكبيرة
  displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color:isDark ? AppClores.darkText : AppClores.lightText),

  // عناوين متوسطة الحجم - تستخدم في أقسام بارزة
  displayMedium: AppStyles.styleRegular14(context).copyWith(color:isDark ? Colors.white : Colors.black),

  // عناوين صغيرة ولكن بارزة - مثلاً في بطاقات كبيرة أو شاشات ترحيبية
  displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color:isDark ? Colors.white : Colors.black),

  // عنوان رئيسي للشاشة - مثل اسم الصفحة
  headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color:isDark ? Colors.white : Colors.black),

  // عنوان فرعي - أسفل العنوان الرئيسي
  headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color:isDark ? Colors.white : Colors.black),

  // عنوان ثانوي - مثل عناوين الأقسام داخل الصفحة
  headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color:isDark ? Colors.white : Colors.black),

  // عنوان رئيسي في البطاقة أو الحوارات
  titleLarge: AppStyles.styleSemiBold26(context,).copyWith(color: Colors.blue),

  // عنوان متوسط الحجم - يستخدم في مربعات النصوص أو الحقول
  titleMedium:  AppStyles.styleRegular14(context).copyWith(color:isDark ? Colors.white : Colors.black),
  // عنوان صغير - يُستخدم فوق الحقول أو داخل التبويبات
  titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color:isDark ? Colors.white : Colors.black),

  // نص كبير - للفقرات الأساسية أو الأوصاف
  bodyLarge: TextStyle(fontSize: 16, color:isDark ? Colors.white : Colors.black),

  // النص الافتراضي - يُستخدم في معظم العناصر
  bodyMedium: TextStyle(fontSize: 14, color:isDark ? Colors.white : Colors.black),

  // نصوص صغيرة - مثل التوضيحات أو التذييل
  bodySmall: TextStyle(fontSize: 12, color:isDark ? Colors.white : Colors.black),

  // نص أزرار أو CTA - يكون مميزًا وواضحًا
  labelLarge: AppStyles.styleRegular14(context).copyWith(color:isDark ? Colors.white : Colors.black),

  // نصوص فرعية للعناصر التفاعلية (كالقوائم)
  labelMedium: AppStyles.styleRegular14(context).copyWith(color:isDark ? Colors.white : Colors.black),

  // نصوص صغيرة جدًا - مثل الحالات أو الإشعارات الصغيرة
  labelSmall: AppStyles.styleRegular12(context).copyWith(color:isDark ? Colors.white : Colors.black),
);

} 


  /// Dark Text Theme
  static const TextTheme _darkTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
  );

  /// Shared Elevated Button Theme
  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF2F1F1),
        foregroundColor: Colors.black,
        
      ),
    );
  }
}
