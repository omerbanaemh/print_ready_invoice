import 'package:flutter/material.dart';

import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_app_bar.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_body.dart';

class InvoiceDesktopLayout extends StatelessWidget {
  const InvoiceDesktopLayout({super.key, required this.scaffoldKey});

 final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Center(
            child: SizedBox(
              // width:constraints.maxWidth > 970 ?  SizeConfig.width(context) / 1.6 : constraints.maxWidth > 790 ?  SizeConfig.width(context) / 1.3 : SizeConfig.width(context) / 1.1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomInvoiceAppBar( scaffoldKey: scaffoldKey,),
                    SizedBox(height: 20),
                    CustomInvoiceBody(),
                    // CustomInvoiceBody(),
                  ],
                ),
              ),
            ),
          );
  }
}