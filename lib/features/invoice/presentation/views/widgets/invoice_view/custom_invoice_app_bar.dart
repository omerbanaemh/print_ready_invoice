import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_button.dart';

class CustomInvoiceAppBar extends StatelessWidget {
  const CustomInvoiceAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Onyx IX Solutions',
          style: AppStyles.styleSemiBold26(context),
        ),
        Row(
          children: [
            CustomButton(backgroundColor: Colors.white, foregroundColor: Colors.black, text: 'EN', borderRight: false,),
            CustomButton(backgroundColor: Colors.white, foregroundColor: Colors.black, text: 'AR',borderLeft: false,),
            SizedBox(width: 8),
            CustomButton(backgroundColor: Colors.white, foregroundColor: Colors.black, icon: Icons.light_mode),
            SizedBox(width: 8),
            CustomButton(backgroundColor: Colors.white, foregroundColor: Colors.black, text: 'AI Suggest Discount', icon: Icons.lightbulb_outline),
            SizedBox(width: 8),
            CustomButton(backgroundColor: Colors.blue, foregroundColor: Colors.white, text: 'Preview Invoice', icon: Icons.print_outlined),
            SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}