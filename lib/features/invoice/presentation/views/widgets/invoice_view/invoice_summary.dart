import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class InvoiceSummary extends StatelessWidget {
  const InvoiceSummary({super.key, required this.products, });

final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: SizedBox(
            width:  200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).subtotal, style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.black54
                    )),
                    Text('\$${(products.calculate().subtotal).toStringAsFixed(2)}',style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.black87
                    )),
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${S.of(context).tax} (8%):', style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.black54
                    )),
                    Text('\$${(products.calculate().tax).toStringAsFixed(2)}',style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.black87
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                     color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).grand_total, style: AppStyles.styleSemiBold14(context)),
                      Text('\$${(products.calculate().total).toStringAsFixed(2)}',style: AppStyles.styleSemiBold14(context),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}