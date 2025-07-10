import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_app_bar.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_body.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width:constraints.maxWidth > 970 ?  SizeConfig.width(context) / 1.6 : constraints.maxWidth > 790 ?  SizeConfig.width(context) / 1.3 : SizeConfig.width(context) / 1.1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomInvoiceAppBar(),
                    SizedBox(height: 20),
                    BlocProvider(
                      create: (context) => InvoiceCubit()..loadInitial(),
                      child: CustomInvoiceBody(),
                    ),
                    // CustomInvoiceBody(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
