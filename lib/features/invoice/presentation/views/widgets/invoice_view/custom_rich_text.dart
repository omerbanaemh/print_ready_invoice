import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.late, required this.text});
  final String late, text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: late, style: AppStyles.styleRegular12(context)),
          TextSpan(
            text: text,
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: Colors.black38),
          ),
        ],
      ),
    );
  }
}