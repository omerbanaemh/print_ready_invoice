
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/localization_cubit/localization_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/pdf_widgets/print_invoice_services.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

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
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).menu),
                      IconButton(
                        icon: const Icon(Icons.close),
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
                        ),
                        const SizedBox(width: 8),
                        CustomButton(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          text: S.of(context).invoice_preview,
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
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
        ],
      ),
    );
  }
}
