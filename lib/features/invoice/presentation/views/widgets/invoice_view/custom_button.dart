import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.backgroundColor, required this.foregroundColor, this.text, this.icon, this.borderLeft, this.borderRight, this.onPressed,
  });
  final Color backgroundColor,foregroundColor;
  final String? text;
  final IconData? icon;
  final bool? borderLeft, borderRight;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          foregroundColor,
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
         const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: borderLeft == null || borderLeft == true ? const Radius.circular(4) : Radius.zero,
              right: borderRight == null || borderRight == true ? const Radius.circular(4) : Radius.zero,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: RichText(
  text: TextSpan(
    children: [
      WidgetSpan(
        child: Icon(icon, size: 16),
      ),
      TextSpan(
        text: text,
        style: AppStyles.styleRegular14(context).copyWith(color:foregroundColor,),
      ),
    ],
  ),
)
     
    );
  }
}