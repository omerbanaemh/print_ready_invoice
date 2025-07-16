import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/adaptive_layout_widget.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_details_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_body_header.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/invoice_info_section.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/invoice_summary.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/invoice_table.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class CustomInvoiceBody extends StatelessWidget {
  const CustomInvoiceBody({super.key, required this.productDetails});

  final ProductDetailsEntity productDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomInvoiceBodyHeader(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xFFFDFDFD),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            border: Border(
              top: BorderSide.none,
              left: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
              right: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
              bottom: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
            ),
          ),
          child: Column(
            children: [
              InvoiceInfoSection(productDetails: productDetails),
              BlocConsumer<InvoiceCubit, InvoiceState>(
                listener: (context, state) {
                  if (state is InvoiceFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  return BlocBuilder<InvoiceCubit, InvoiceState>(
                    builder: (context, state) {
                      if (state is InvoiceLoaded) {
                        final List<ProductEntity> products = state.products;
                        return NewWidget(products: products);
                      }else  {
                        return const NewWidget(products:[]);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InvoiceCubit>();
    return Column(
      children: [
        const SizedBox(height: 12),
        AdaptiveLayoutWidget(
          mobileLayout: (context) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 550,
                  child: InvoiceTable(products: products, cubit: cubit,),
                ),
              ],
            ),
          ),
          desktopLayout: (context) => SizedBox(
            width: double.infinity,
            child: InvoiceTable(products: products, cubit: cubit,),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              backgroundColor: const Color(0xFFF3F3F3),
              foregroundColor: Colors.black,
              text: S.of(context).add_item,
              icon: Icons.add,
              onPressed: () {
                cubit.addProduct();
              },
            ),
          ],
        ),
        const SizedBox(height: 25),
        const Divider(),
        const SizedBox(height: 25),
        // InvoiceSummary(cubit: cubit),
      ],
    );
  }
}
