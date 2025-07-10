import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';
import 'package:print_ready_invoice/features/invoice/presentation/manger/cubit/invoice_cubit.dart';

class InvoiceSummary extends StatelessWidget {
  const InvoiceSummary({super.key, required this.cubit,});

final InvoiceCubit cubit;
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
                    Text('Subtotal', style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.black54
                    )),
                    Text('\$${(cubit.subtotal).toStringAsFixed(2)}',style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.black87
                    )),
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax (8%):', style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.black54
                    )),
                    Text('\$${(cubit.tax).toStringAsFixed(2)}',style: AppStyles.styleRegular14(context).copyWith(
                      color: Colors.black87
                    )),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: Colors.black12, thickness: 1),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                     color: Colors.blue[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Grand Total', style: AppStyles.styleSemiBold14(context)),
                      Text('\$${(cubit.total).toStringAsFixed(2)}',style: AppStyles.styleSemiBold14(context),),
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