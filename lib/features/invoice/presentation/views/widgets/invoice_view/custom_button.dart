import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.backgroundColor, required this.foregroundColor, this.text, this.icon, this.borderLeft, this.borderRight,
  });
  final Color backgroundColor,foregroundColor;
  final String? text;
  final IconData? icon;
  final bool? borderLeft, borderRight;

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
          EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: borderLeft == null || borderLeft == true ? Radius.circular(4) : Radius.zero,
              right: borderRight == null || borderRight == true ? Radius.circular(4) : Radius.zero,
            ),
          ),
        ),
      ),
      onPressed: () {},
      child: SizedBox(
        child: Center(
          child: Row(
            children: [
              icon != null ? Icon(icon,) :SizedBox(),
              SizedBox( width: icon == null || text == null? 0 : 6),
              Text(
                text ?? '',
                style: AppStyles.styleMedium16(
                  context,
                ).copyWith(
                  color: foregroundColor,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}