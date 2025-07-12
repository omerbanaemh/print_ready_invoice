import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';
import 'package:print_ready_invoice/generated/l10n.dart';

class CustomInvoiceBodyHeader extends StatelessWidget {
  const CustomInvoiceBodyHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        border: const Border(
          top: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
          left: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
          right: BorderSide(width: 1, color: Color(0xFFD6D8DB)),
          bottom: BorderSide.none,
        ),
      ),
        
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 100,),
                    child: Image.asset('assets/images/onix_ix.png',fit: BoxFit.fill,)),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Onyx IX Solutions',
                        style: AppStyles.styleSemiBold18(
                          context,
                        ).copyWith(color: Colors.blue),
                      ),
                      Text(
                        '123 Innovation Drive, Tech City, 12345',
                        style: AppStyles.styleMedium16(
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  S.of(context).invoice,
                  style: AppStyles.styleSemiBold24(context),
                ),
                Text(
                  'INV-2024-001',
                  style: AppStyles.styleMedium16(context),
                ),
                Text(
                  'Date: 7-7-2025',
                  style: AppStyles.styleMedium16(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}