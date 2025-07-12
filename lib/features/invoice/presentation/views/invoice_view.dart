import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/models/product_details_model.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/localization_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_app_bar.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_body.dart';
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
          child: SizedBox( child:  Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 500),
              child: SizedBox(
                width: SizeConfig.width(context) * 0.6,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CustomInvoiceAppBar( scaffoldKey: scaffoldKey,),
                  SizedBox(height: 20),
                  CustomInvoiceBody(productDetails: productDetails,),
                  // CustomInvoiceBody(),
                ],
              ),
            ),
          ),)))
        ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width(context) * 0.75,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).menu),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),

                  SizedBox(
                    child: Column(
                      children: [
                        CustomButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          text: 'EN',
                          borderRight: false,
                          onPressed: () {
                            context.read<LocalizationCubit>().changeLocale(
                              'en',
                            );
                          },
                        ),
                        CustomButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          text: 'AR',
                          borderLeft: false,
                          onPressed: () {
                            context.read<LocalizationCubit>().changeLocale(
                              'ar',
                            );
                          },
                        ),
                        SizedBox(width: 8),
                        CustomButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          icon: Icons.light_mode,
                          onPressed: () {
                            AdaptiveTheme.of(
                              context,
                            ).toggleThemeMode(useSystem: false);
                          },
                        ),
                        SizedBox(width: 8),
                        CustomButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          text: S.of(context).ai_suggest_discount,
                          icon: Icons.lightbulb_outline,
                        ),
                        SizedBox(width: 8),
                        CustomButton(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          text: S.of(context).invoice_preview,
                          icon: Icons.print_outlined,
                          onPressed: () {
                            final cubit = context.read<InvoiceCubit>();
                            final state = cubit.state as InvoiceLoaded;
                            cubit.printInvoice(
                              state.productItems,
                              cubit.subtotal,
                              cubit.tax,
                              cubit.total,
                            );
                          },
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
        ],
      ),
    );
  }
}
