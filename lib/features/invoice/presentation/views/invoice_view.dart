import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_app_bar.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_body.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: SizeConfig.width(context) * 0.6,
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomInvoiceAppBar(),
              SizedBox(height: 20),
              CustomInvoiceBody(),
            ],
          ),
        ),
      ),
    );
  }
}


