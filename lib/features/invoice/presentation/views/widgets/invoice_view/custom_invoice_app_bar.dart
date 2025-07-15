import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/localization_cubit/localization_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/pdf_widgets/print_invoice_services.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class CustomInvoiceAppBar extends StatelessWidget {
  const CustomInvoiceAppBar({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.width(context));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Onyx IX Solutions', style: AppStyles.styleSemiBold26(context).copyWith(color: Colors.blue),),

        SizeConfig.width(context) < SizeConfig.desktop
            ? IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu),
              )
            : Flexible(
                child: Wrap(
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
                    const SizedBox(width: 8),
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
                    const SizedBox(width: 8),
                    CustomButton(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      text: S.of(context).ai_suggest_discount,
                      icon: Icons.lightbulb_outline,
                      onPressed: (){},
                    ),
                    const SizedBox(width: 8),
                    CustomButton(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      text: S.of(context).printReady_invoice,
                      icon: Icons.print_outlined,
                      onPressed: () {
                        final cubit = context.read<InvoiceCubit>();
                        printInvoice(
                          cubit.newList,
                          cubit.subtotal,
                          cubit.tax,
                          cubit.total,
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
      ],
    );
  }
}
