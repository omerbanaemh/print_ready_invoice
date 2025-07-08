
import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';

InputDecoration customInputDecoration({String? hintText, String? errorText,required BuildContext context}) {
  return InputDecoration(
    hintText: hintText,
    errorText: errorText,
    hintStyle: AppStyles.styleRegular14(context).copyWith(
      color: const Color.fromARGB(255, 126, 126, 126),
    ),
    fillColor: const Color(0xFFEEF0F2),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
    ),
  );
}