import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/models/product_details_model.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/localization_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_drawer.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_app_bar.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_body.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/pdf_widgets/print_invoice_services.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class InvoiceView extends StatelessWidget {
  InvoiceView({super.key, required this.productDetails});

  final ProductDetailsModel productDetails;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MediaQuery.sizeOf(context).width < SizeConfig.desktop
          ? const CustomDrawer()
          : null,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 500),
          child: SizedBox(
            width: SizeConfig.width(context) * 0.6,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CustomInvoiceAppBar(scaffoldKey: scaffoldKey),
                  SizedBox(height: 20),
                  CustomInvoiceBody(productDetails: productDetails),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}