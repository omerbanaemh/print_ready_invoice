import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/app_styles.dart';

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
        color: Colors.blue[50],
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
          Flexible(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text(
                      '150 * 50',
                      style: AppStyles.styleSemiBold18(
                        context,
                      ).copyWith(color: Colors.black38),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
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
                        ).copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'INVOICE',
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
        ],
      ),
    );
  }
}