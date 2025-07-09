import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_body_header.dart';

class CustomInvoiceBody extends StatelessWidget {
  const CustomInvoiceBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInvoiceBodyHeader(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFFDFDFD),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            border: const Border(
              top: BorderSide.none,
              left: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
              right: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
              bottom: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
            ),                    
          ),
          child: Column(children: [SizedBox(height: 20)]),
        ),
      ],
    );
  }
}