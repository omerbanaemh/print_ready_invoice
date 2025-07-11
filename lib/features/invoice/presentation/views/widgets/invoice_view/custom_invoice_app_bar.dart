import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/localization_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_button.dart';

class CustomInvoiceAppBar extends StatelessWidget {
  const CustomInvoiceAppBar({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Onyx IX Solutions', style: AppStyles.styleSemiBold26(context)),

        


        SizeConfig.width(context) < SizeConfig.desktop
            ? IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu),
              )
            : Flexible(
                child: SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          text: 'EN',
                          borderRight: false,
                          onPressed: () {
                            context.read<LocalizationCubit>().changeLocale('en');
                          },
                        ),
                        CustomButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          text: 'AR',
                          borderLeft: false,
                          onPressed: () {
                            context.read<LocalizationCubit>().changeLocale('ar');
                          },
                        ),
                        SizedBox(width: 8),
                        CustomButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          icon: Icons.light_mode,
                          onPressed: () {
                            AdaptiveTheme.of(context).toggleThemeMode(useSystem: false);
                          },
                        ),
                        SizedBox(width: 8),
                        CustomButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          text: 'AI Suggest Discount',
                          icon: Icons.lightbulb_outline,
                        ),
                        SizedBox(width: 8),
                        CustomButton(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          text: 'Preview Invoice',
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
                ),
              ),
      ],
    );
  }
}
