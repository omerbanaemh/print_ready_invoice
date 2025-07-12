import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:print_ready_invoice/core/utils/adaptive_layout_widget.dart';
import 'package:print_ready_invoice/features/invoice/models/product_details_model.dart';
import 'package:print_ready_invoice/features/invoice/models/product_model.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_button.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/custom_invoice_body_header.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/invoice_info_section.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/invoice_summary.dart';
import 'package:print_ready_invoice/features/invoice/presentation/views/widgets/invoice_view/invoice_table.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class CustomInvoiceBody extends StatelessWidget {
  const CustomInvoiceBody({super.key, required this.productDetails});

final ProductDetailsModel productDetails;
  @override
  Widget build(BuildContext context) {
    return 

       Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            child: Column(
              children: [
                InvoiceInfoSection(productDetails: productDetails,),
                BlocBuilder<InvoiceCubit, InvoiceState>(
                  builder: (context, state) {
           
                      // final List<ProductModel> productItems = state.productItems;
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
                                  // width: double.infinity,
                                  child: InvoiceTable(
                                    productItems: cubit.newList,
                                    cubit: cubit,
                                  ),
                                ),
                              ],
                            ),
                          ),
                            desktopLayout: (context) => SizedBox(
                              width: double.infinity,
                              child: InvoiceTable(
                                productItems: cubit.newList,
                                cubit: cubit,
                              ),
                            ),),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                backgroundColor: Color(0xFFF3F3F3),
                                foregroundColor: Colors.black,
                                text: S.of(context).add_item,
                                icon: Icons.add,
                                onPressed: () {
                                  cubit.addItem();
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Divider(),
                          SizedBox(height: 25),
                          InvoiceSummary(cubit: cubit,),
                        ],
                      );
          
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
    );
  }
}